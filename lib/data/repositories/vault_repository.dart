import 'package:drift/drift.dart' show OrderingTerm;

import '../../core/errors/failure.dart';
import '../../shared/models/models.dart';
import '../mappers/domain_mappers.dart';
import '../sources/drift/tonary_database.dart';

/// Domain-facing read API for the curated knowledge base (Tonary Vault, and the
/// records Scout/Briefs/Flow read). Features depend on this interface, never on
/// Drift directly (`.claude/architecture/data-layer.md`).
abstract interface class VaultRepository {
  Future<List<Plugin>> listPlugins();
  Future<Plugin> pluginById(String id);
  Future<List<Preset>> presetsForPlugin(String pluginId);
  Future<List<WorkflowRecipe>> listRecipes();
  Future<List<SoundDesignNote>> notesForSubject(String subjectId);
  Future<SourceReference> sourceById(String id);
}

class VaultRepositoryImpl implements VaultRepository {
  VaultRepositoryImpl(this._db);

  final TonaryDatabase _db;

  @override
  Future<List<Plugin>> listPlugins() async {
    final rows = await (_db.select(
      _db.plugins,
    )..orderBy([(t) => OrderingTerm(expression: t.name)])).get();
    return rows.map(DomainMappers.plugin).toList();
  }

  @override
  Future<Plugin> pluginById(String id) async {
    final row = await (_db.select(
      _db.plugins,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    if (row == null) throw NotFoundFailure('Plugin "$id" not found.');
    return DomainMappers.plugin(row);
  }

  @override
  Future<List<Preset>> presetsForPlugin(String pluginId) async {
    final rows = await (_db.select(
      _db.presets,
    )..where((t) => t.pluginId.equals(pluginId))).get();
    return rows.map(DomainMappers.preset).toList();
  }

  @override
  Future<List<WorkflowRecipe>> listRecipes() async {
    final rows = await _db.select(_db.workflowRecipes).get();
    return rows.map(DomainMappers.workflowRecipe).toList();
  }

  @override
  Future<List<SoundDesignNote>> notesForSubject(String subjectId) async {
    // subjectRefs is a JSON array column; filter in Dart (dataset is small,
    // offline). Normalize to a join table only if this becomes a hot path.
    final rows = await _db.select(_db.soundDesignNotes).get();
    return rows
        .map(DomainMappers.soundDesignNote)
        .where((n) => n.subjectRefs.contains(subjectId))
        .toList();
  }

  @override
  Future<SourceReference> sourceById(String id) async {
    final row = await (_db.select(
      _db.sourceReferences,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    if (row == null) throw NotFoundFailure('Source "$id" not found.');
    return DomainMappers.sourceReference(row);
  }
}
