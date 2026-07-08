import 'enums.dart';

/// Pure domain models for the Tonary knowledge base. No Flutter, no DB
/// annotations — the data layer maps DTOs/rows into these at the boundary
/// (`.claude/architecture/data-layer.md`). Field lists follow `.claude/schemas/`.
///
/// Recommendation: these hand-written immutable classes can migrate to `freezed`
/// later (dep already present) without changing call sites.

class SourceReference {
  const SourceReference({
    required this.id,
    required this.title,
    required this.sourceType,
    required this.retrievedAt,
    required this.reliability,
    this.url,
    this.publisher,
    this.author,
    this.notes,
  });

  final String id;
  final String title;
  final SourceType sourceType;
  final String retrievedAt;
  final Reliability reliability;
  final String? url;
  final String? publisher;
  final String? author;
  final String? notes;
}

/// One documented control on a plugin. A sub-fact of its [Plugin] record —
/// covered by the plugin's [Plugin.sources]. `range` is a display string
/// (e.g. "-18–18 dB", "0-100%") so heterogeneous source formats map uniformly.
class PluginParameter {
  const PluginParameter({
    required this.name,
    this.section,
    this.range,
    this.defaultValue,
    this.options = const [],
    this.description,
  });

  final String name;
  final String? section;
  final String? range;
  final String? defaultValue;
  final List<String> options;
  final String? description;
}

class Plugin {
  const Plugin({
    required this.id,
    required this.name,
    required this.vendor,
    required this.category,
    required this.type,
    required this.tier,
    required this.description,
    required this.tags,
    required this.capabilities,
    required this.sources,
    this.vendorName,
    this.color,
    this.manualUrl,
    this.parameters = const [],
  });

  final String id;
  final String name;
  final String vendor;
  final String? vendorName;
  final String category;
  final PluginType type;
  final PluginTier tier;
  final String description;
  final List<String> tags;
  final List<String> capabilities;
  final String? color;
  final String? manualUrl;
  final List<String> sources; // Source Reference ids
  final List<PluginParameter> parameters; // documented controls (sourced)
}

class Preset {
  const Preset({
    required this.id,
    required this.pluginId,
    required this.name,
    required this.category,
    required this.useCases,
    required this.genreTags,
    required this.sources,
    this.params,
    this.notes,
  });

  final String id;
  final String pluginId;
  final String name;
  final String category;
  final Map<String, dynamic>? params; // illustrative unless sourced
  final List<String> useCases;
  final List<String> genreTags;
  final String? notes;
  final List<String> sources;
}

class WorkflowStep {
  const WorkflowStep({
    required this.order,
    required this.action,
    this.pluginId,
    this.tip,
  });

  final int order;
  final String action;
  final String? pluginId;
  final String? tip;
}

class WorkflowRecipe {
  const WorkflowRecipe({
    required this.id,
    required this.title,
    required this.goal,
    required this.pluginChain,
    required this.steps,
    required this.difficulty,
    required this.timeEstimate,
    required this.genreTags,
    required this.sources,
    this.presetRefs = const [],
  });

  final String id;
  final String title;
  final String goal;
  final List<String> pluginChain; // Plugin ids in signal order
  final List<WorkflowStep> steps;
  final Difficulty difficulty;
  final String timeEstimate;
  final List<String> genreTags;
  final List<String> presetRefs;
  final List<String> sources;
}

class SoundDesignNote {
  const SoundDesignNote({
    required this.id,
    required this.topic,
    required this.subjectRefs,
    required this.body,
    required this.evidenceLevel,
    required this.sources,
    required this.createdAt,
    this.noteType,
    this.updatedAt,
  });

  final String id;
  final String topic;
  final List<String> subjectRefs; // Plugin/Preset ids
  final String body;
  final EvidenceLevel evidenceLevel;
  final String? noteType;
  final List<String> sources;
  final String createdAt;
  final String? updatedAt;
}

/// The one user-writable record (see `user-session.schema.md`).
class SavedItem {
  const SavedItem({
    required this.refType,
    required this.refId,
    required this.savedAt,
    this.rowId,
  });

  final int? rowId;
  final SavedItemRefType refType;
  final String refId;
  final String savedAt;
}
