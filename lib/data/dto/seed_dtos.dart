/// DTOs mirroring the bundled seed JSON shape (`assets/seed/*.json`).
/// Hand-written `fromJson` — messy/nullable to match source reality. Mappers
/// convert these into Drift companions (write) and domain models (read).
library;

List<String> _stringList(Object? v) =>
    (v as List?)?.map((e) => e as String).toList() ?? const [];

class SourceReferenceDto {
  SourceReferenceDto({
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
  final String sourceType;
  final String retrievedAt;
  final String reliability;
  final String? url;
  final String? publisher;
  final String? author;
  final String? notes;

  factory SourceReferenceDto.fromJson(Map<String, dynamic> j) =>
      SourceReferenceDto(
        id: j['id'] as String,
        title: j['title'] as String,
        sourceType: j['sourceType'] as String,
        retrievedAt: j['retrievedAt'] as String,
        reliability: j['reliability'] as String,
        url: j['url'] as String?,
        publisher: j['publisher'] as String?,
        author: j['author'] as String?,
        notes: j['notes'] as String?,
      );
}

class PluginDto {
  PluginDto({
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
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String name;
  final String vendor;
  final String? vendorName;
  final String category;
  final String type;
  final String tier;
  final String description;
  final List<String> tags;
  final List<String> capabilities;
  final String? color;
  final String? manualUrl;
  final List<String> sources;
  final String? createdAt;
  final String? updatedAt;

  factory PluginDto.fromJson(Map<String, dynamic> j) => PluginDto(
        id: j['id'] as String,
        name: j['name'] as String,
        vendor: j['vendor'] as String,
        vendorName: j['vendorName'] as String?,
        category: j['category'] as String,
        type: j['type'] as String,
        tier: j['tier'] as String,
        description: j['description'] as String,
        tags: _stringList(j['tags']),
        capabilities: _stringList(j['capabilities']),
        color: j['color'] as String?,
        manualUrl: j['manualUrl'] as String?,
        sources: _stringList(j['sources']),
        createdAt: j['createdAt'] as String?,
        updatedAt: j['updatedAt'] as String?,
      );
}

class PresetDto {
  PresetDto({
    required this.id,
    required this.pluginId,
    required this.name,
    required this.category,
    required this.useCases,
    required this.genreTags,
    required this.sources,
    this.params,
    this.notes,
    this.createdAt,
  });

  final String id;
  final String pluginId;
  final String name;
  final String category;
  final Map<String, dynamic>? params;
  final List<String> useCases;
  final List<String> genreTags;
  final String? notes;
  final List<String> sources;
  final String? createdAt;

  factory PresetDto.fromJson(Map<String, dynamic> j) => PresetDto(
        id: j['id'] as String,
        pluginId: j['pluginId'] as String,
        name: j['name'] as String,
        category: j['category'] as String,
        params: (j['params'] as Map?)?.cast<String, dynamic>(),
        useCases: _stringList(j['useCases']),
        genreTags: _stringList(j['genreTags']),
        notes: j['notes'] as String?,
        sources: _stringList(j['sources']),
        createdAt: j['createdAt'] as String?,
      );
}

class WorkflowStepDto {
  WorkflowStepDto({
    required this.order,
    required this.action,
    this.pluginId,
    this.tip,
  });

  final int order;
  final String action;
  final String? pluginId;
  final String? tip;

  factory WorkflowStepDto.fromJson(Map<String, dynamic> j) => WorkflowStepDto(
        order: (j['order'] as num).toInt(),
        action: j['action'] as String,
        pluginId: j['pluginId'] as String?,
        tip: j['tip'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'order': order,
        'action': action,
        if (pluginId != null) 'pluginId': pluginId,
        if (tip != null) 'tip': tip,
      };
}

class WorkflowRecipeDto {
  WorkflowRecipeDto({
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
    this.createdAt,
  });

  final String id;
  final String title;
  final String goal;
  final List<String> pluginChain;
  final List<WorkflowStepDto> steps;
  final String difficulty;
  final String timeEstimate;
  final List<String> genreTags;
  final List<String> presetRefs;
  final List<String> sources;
  final String? createdAt;

  factory WorkflowRecipeDto.fromJson(Map<String, dynamic> j) =>
      WorkflowRecipeDto(
        id: j['id'] as String,
        title: j['title'] as String,
        goal: j['goal'] as String,
        pluginChain: _stringList(j['pluginChain']),
        steps: (j['steps'] as List?)
                ?.map((e) =>
                    WorkflowStepDto.fromJson((e as Map).cast<String, dynamic>()))
                .toList() ??
            const [],
        difficulty: j['difficulty'] as String,
        timeEstimate: j['timeEstimate'] as String,
        genreTags: _stringList(j['genreTags']),
        presetRefs: _stringList(j['presetRefs']),
        sources: _stringList(j['sources']),
        createdAt: j['createdAt'] as String?,
      );
}

class SoundDesignNoteDto {
  SoundDesignNoteDto({
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
  final List<String> subjectRefs;
  final String body;
  final String evidenceLevel;
  final String? noteType;
  final List<String> sources;
  final String createdAt;
  final String? updatedAt;

  factory SoundDesignNoteDto.fromJson(Map<String, dynamic> j) =>
      SoundDesignNoteDto(
        id: j['id'] as String,
        topic: j['topic'] as String,
        subjectRefs: _stringList(j['subjectRefs']),
        body: j['body'] as String,
        evidenceLevel: j['evidenceLevel'] as String,
        noteType: j['noteType'] as String?,
        sources: _stringList(j['sources']),
        createdAt: j['createdAt'] as String,
        updatedAt: j['updatedAt'] as String?,
      );
}

/// The full parsed seed dataset.
class SeedData {
  SeedData({
    required this.sourceReferences,
    required this.plugins,
    required this.presets,
    required this.workflowRecipes,
    required this.soundDesignNotes,
  });

  final List<SourceReferenceDto> sourceReferences;
  final List<PluginDto> plugins;
  final List<PresetDto> presets;
  final List<WorkflowRecipeDto> workflowRecipes;
  final List<SoundDesignNoteDto> soundDesignNotes;
}
