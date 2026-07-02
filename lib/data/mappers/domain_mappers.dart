import 'dart:convert';

import '../../shared/models/enums.dart';
import '../../shared/models/models.dart';
import '../sources/drift/tonary_database.dart';

/// Pure mappers: Drift row -> domain model. The ONLY place field/type
/// reconciliation happens. Fully unit-testable (`.claude/architecture/data-layer.md`).
abstract final class DomainMappers {
  static List<String> _list(String json) =>
      (jsonDecode(json) as List).map((e) => e as String).toList();

  static SourceReference sourceReference(SourceReferenceRow r) => SourceReference(
        id: r.id,
        title: r.title,
        sourceType: SourceType.fromWire(r.sourceType),
        retrievedAt: r.retrievedAt,
        reliability: Reliability.fromWire(r.reliability),
        url: r.url,
        publisher: r.publisher,
        author: r.author,
        notes: r.notes,
      );

  static Plugin plugin(PluginRow r) => Plugin(
        id: r.id,
        name: r.name,
        vendor: r.vendor,
        vendorName: r.vendorName,
        category: r.category,
        type: PluginType.fromWire(r.type),
        tier: PluginTier.fromWire(r.tier),
        description: r.description,
        tags: _list(r.tags),
        capabilities: _list(r.capabilities),
        color: r.color,
        manualUrl: r.manualUrl,
        sources: _list(r.sources),
      );

  static Preset preset(PresetRow r) => Preset(
        id: r.id,
        pluginId: r.pluginId,
        name: r.name,
        category: r.category,
        params: r.params == null
            ? null
            : (jsonDecode(r.params!) as Map).cast<String, dynamic>(),
        useCases: _list(r.useCases),
        genreTags: _list(r.genreTags),
        notes: r.notes,
        sources: _list(r.sources),
      );

  static WorkflowRecipe workflowRecipe(WorkflowRecipeRow r) => WorkflowRecipe(
        id: r.id,
        title: r.title,
        goal: r.goal,
        pluginChain: _list(r.pluginChain),
        steps: (jsonDecode(r.steps) as List)
            .map((e) => (e as Map).cast<String, dynamic>())
            .map((m) => WorkflowStep(
                  order: (m['order'] as num).toInt(),
                  action: m['action'] as String,
                  pluginId: m['pluginId'] as String?,
                  tip: m['tip'] as String?,
                ))
            .toList(),
        difficulty: Difficulty.fromWire(r.difficulty),
        timeEstimate: r.timeEstimate,
        genreTags: _list(r.genreTags),
        presetRefs: r.presetRefs == null ? const [] : _list(r.presetRefs!),
        sources: _list(r.sources),
      );

  static SoundDesignNote soundDesignNote(SoundDesignNoteRow r) => SoundDesignNote(
        id: r.id,
        topic: r.topic,
        subjectRefs: _list(r.subjectRefs),
        body: r.body,
        evidenceLevel: EvidenceLevel.fromWire(r.evidenceLevel),
        noteType: r.noteType,
        sources: _list(r.sources),
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
      );

  static SavedItem savedItem(SavedItemRow r) => SavedItem(
        rowId: r.rowId,
        refType: SavedItemRefType.fromWire(r.refType),
        refId: r.refId,
        savedAt: r.savedAt,
      );
}
