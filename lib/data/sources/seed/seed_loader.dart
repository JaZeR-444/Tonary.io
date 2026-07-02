import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../core/errors/failure.dart';
import '../../dto/seed_dtos.dart';
import '../drift/tonary_database.dart';
import 'seed_validator.dart';

/// Signature for reading a bundled asset as a string (e.g. `rootBundle.loadString`).
typedef AssetReader = Future<String> Function(String assetPath);

/// Hydrates the Drift database from the bundled seed JSON on first run.
/// Idempotent: re-runs only when the bundled [seedVersion] changes
/// (`.claude/architecture/content-knowledge-base.md`).
class SeedLoader {
  SeedLoader(this._db, {SeedValidator? validator})
    : _validator = validator ?? SeedValidator();

  final TonaryDatabase _db;
  final SeedValidator _validator;

  static const _metaKey = 'seedVersion';
  static const seedAssetDir = 'assets/seed';

  /// Parse the five seed files (pure — no IO, unit-testable).
  static SeedData parse({
    required String sourceReferencesJson,
    required String pluginsJson,
    required String presetsJson,
    required String workflowRecipesJson,
    required String soundDesignNotesJson,
  }) {
    List<Map<String, dynamic>> arr(String s) => (jsonDecode(s) as List)
        .map((e) => (e as Map).cast<String, dynamic>())
        .toList();

    return SeedData(
      sourceReferences: arr(
        sourceReferencesJson,
      ).map(SourceReferenceDto.fromJson).toList(),
      plugins: arr(pluginsJson).map(PluginDto.fromJson).toList(),
      presets: arr(presetsJson).map(PresetDto.fromJson).toList(),
      workflowRecipes: arr(
        workflowRecipesJson,
      ).map(WorkflowRecipeDto.fromJson).toList(),
      soundDesignNotes: arr(
        soundDesignNotesJson,
      ).map(SoundDesignNoteDto.fromJson).toList(),
    );
  }

  /// Ensures the DB is seeded with the bundled dataset at [seedVersion].
  /// Throws [SeedValidationException] if the dataset is invalid (fail closed).
  Future<void> ensureSeeded({
    required AssetReader readAsset,
    required int seedVersion,
  }) async {
    final current = await _readSeedVersion();
    if (current == seedVersion) return; // already up to date

    final data = parse(
      sourceReferencesJson: await readAsset(
        '$seedAssetDir/source_references.json',
      ),
      pluginsJson: await readAsset('$seedAssetDir/plugins.json'),
      presetsJson: await readAsset('$seedAssetDir/presets.json'),
      workflowRecipesJson: await readAsset(
        '$seedAssetDir/workflow_recipes.json',
      ),
      soundDesignNotesJson: await readAsset(
        '$seedAssetDir/sound_design_notes.json',
      ),
    );

    await hydrate(data, seedVersion: seedVersion);
  }

  /// Validates then writes [data] into Drift in a single transaction.
  /// Separated from IO so tests can drive it with an in-memory database.
  Future<void> hydrate(SeedData data, {required int seedVersion}) async {
    final errors = _validator.validate(data);
    if (errors.isNotEmpty) throw SeedValidationException(errors);

    await _db.transaction(() async {
      // Replace seed-derived tables (SavedItems is user data — never touched).
      await _db.delete(_db.plugins).go();
      await _db.delete(_db.presets).go();
      await _db.delete(_db.workflowRecipes).go();
      await _db.delete(_db.soundDesignNotes).go();
      await _db.delete(_db.sourceReferences).go();

      await _db.batch((b) {
        b.insertAll(_db.sourceReferences, data.sourceReferences.map(_source));
        b.insertAll(_db.plugins, data.plugins.map(_plugin));
        b.insertAll(_db.presets, data.presets.map(_preset));
        b.insertAll(_db.workflowRecipes, data.workflowRecipes.map(_recipe));
        b.insertAll(_db.soundDesignNotes, data.soundDesignNotes.map(_note));
      });

      await _db
          .into(_db.appMeta)
          .insertOnConflictUpdate(
            AppMetaCompanion.insert(key: _metaKey, value: '$seedVersion'),
          );
    });
  }

  Future<int?> _readSeedVersion() async {
    final row = await (_db.select(
      _db.appMeta,
    )..where((t) => t.key.equals(_metaKey))).getSingleOrNull();
    return row == null ? null : int.tryParse(row.value);
  }

  // ---- DTO -> Drift companion (write mappers) ----

  static SourceReferencesCompanion _source(SourceReferenceDto d) =>
      SourceReferencesCompanion.insert(
        id: d.id,
        title: d.title,
        sourceType: d.sourceType,
        url: Value(d.url),
        publisher: Value(d.publisher),
        author: Value(d.author),
        retrievedAt: d.retrievedAt,
        reliability: d.reliability,
        notes: Value(d.notes),
      );

  static PluginsCompanion _plugin(PluginDto d) => PluginsCompanion.insert(
    id: d.id,
    name: d.name,
    vendor: d.vendor,
    vendorName: Value(d.vendorName),
    category: d.category,
    type: d.type,
    tier: d.tier,
    description: d.description,
    tags: jsonEncode(d.tags),
    capabilities: jsonEncode(d.capabilities),
    color: Value(d.color),
    manualUrl: Value(d.manualUrl),
    sources: jsonEncode(d.sources),
    createdAt: Value(d.createdAt),
    updatedAt: Value(d.updatedAt),
  );

  static PresetsCompanion _preset(PresetDto d) => PresetsCompanion.insert(
    id: d.id,
    pluginId: d.pluginId,
    name: d.name,
    category: d.category,
    params: Value(d.params == null ? null : jsonEncode(d.params)),
    useCases: jsonEncode(d.useCases),
    genreTags: jsonEncode(d.genreTags),
    notes: Value(d.notes),
    sources: jsonEncode(d.sources),
    createdAt: Value(d.createdAt),
  );

  static WorkflowRecipesCompanion _recipe(WorkflowRecipeDto d) =>
      WorkflowRecipesCompanion.insert(
        id: d.id,
        title: d.title,
        goal: d.goal,
        pluginChain: jsonEncode(d.pluginChain),
        steps: jsonEncode(d.steps.map((s) => s.toJson()).toList()),
        difficulty: d.difficulty,
        timeEstimate: d.timeEstimate,
        genreTags: jsonEncode(d.genreTags),
        presetRefs: Value(jsonEncode(d.presetRefs)),
        sources: jsonEncode(d.sources),
        createdAt: Value(d.createdAt),
      );

  static SoundDesignNotesCompanion _note(SoundDesignNoteDto d) =>
      SoundDesignNotesCompanion.insert(
        id: d.id,
        topic: d.topic,
        subjectRefs: jsonEncode(d.subjectRefs),
        body: d.body,
        evidenceLevel: d.evidenceLevel,
        noteType: Value(d.noteType),
        sources: jsonEncode(d.sources),
        createdAt: d.createdAt,
        updatedAt: Value(d.updatedAt),
      );
}
