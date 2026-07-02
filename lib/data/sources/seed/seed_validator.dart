import '../../dto/seed_dtos.dart';

/// Validates a parsed [SeedData] against the Tonary schema rules
/// (`.claude/rules/data-modeling-rules.md`). Pure and fully unit-tested.
///
/// Fail closed: [SeedLoader] refuses to seed when [validate] returns any error,
/// so invalid or unsourced records never enter the database.
class SeedValidator {
  static final RegExp _kebab = RegExp(r'^[a-z0-9]+(-[a-z0-9]+)*$');

  static const _tiers = {'Free', 'Premium'};
  static const _types = {'Generator', 'Effect'};
  static const _difficulties = {'Beginner', 'Intermediate', 'Advanced'};
  static const _evidence = {'Verified', 'Documented', 'Community', 'Inferred'};
  static const _sourceTypes = {
    'official-manual',
    'article',
    'video',
    'original-research',
  };
  static const _reliabilities = {'High', 'Medium', 'Low'};

  /// Returns a list of human-readable violations. Empty list == valid.
  List<String> validate(SeedData data) {
    final errors = <String>[];

    final sourceIds = data.sourceReferences.map((s) => s.id).toSet();
    final pluginIds = data.plugins.map((p) => p.id).toSet();
    final presetIds = data.presets.map((p) => p.id).toSet();

    void checkId(String id, String where) {
      if (!_kebab.hasMatch(id)) {
        errors.add('$where: id "$id" is not kebab-case.');
      }
    }

    void checkEnum(String value, Set<String> allowed, String where) {
      if (!allowed.contains(value)) {
        errors.add('$where: "$value" is not one of ${allowed.join(', ')}.');
      }
    }

    void checkSources(List<String> sources, String where) {
      if (sources.isEmpty) {
        errors.add('$where: sources[] must be non-empty (evidence required).');
      }
      for (final s in sources) {
        if (!sourceIds.contains(s)) {
          errors.add('$where: source "$s" does not resolve to a Source Reference.');
        }
      }
    }

    // Unique ids per collection.
    void checkUnique(Iterable<String> ids, String kind) {
      final seen = <String>{};
      for (final id in ids) {
        if (!seen.add(id)) errors.add('$kind: duplicate id "$id".');
      }
    }

    checkUnique(sourceIds, 'SourceReference');
    checkUnique(pluginIds, 'Plugin');
    checkUnique(presetIds, 'Preset');
    checkUnique(data.workflowRecipes.map((r) => r.id), 'WorkflowRecipe');
    checkUnique(data.soundDesignNotes.map((n) => n.id), 'SoundDesignNote');

    // Source References.
    for (final s in data.sourceReferences) {
      final where = 'SourceReference "${s.id}"';
      checkId(s.id, where);
      checkEnum(s.sourceType, _sourceTypes, where);
      checkEnum(s.reliability, _reliabilities, where);
      if (s.sourceType != 'original-research' &&
          (s.url == null || s.url!.isEmpty)) {
        errors.add('$where: non-original-research source should have a url.');
      }
    }

    // Plugins.
    for (final p in data.plugins) {
      final where = 'Plugin "${p.id}"';
      checkId(p.id, where);
      checkEnum(p.type, _types, where);
      checkEnum(p.tier, _tiers, where);
      if (p.tags.isEmpty) errors.add('$where: tags[] must be non-empty.');
      if (p.capabilities.isEmpty) {
        errors.add('$where: capabilities[] must be non-empty.');
      }
      checkSources(p.sources, where);
    }

    // Presets.
    for (final p in data.presets) {
      final where = 'Preset "${p.id}"';
      checkId(p.id, where);
      if (!pluginIds.contains(p.pluginId)) {
        errors.add('$where: pluginId "${p.pluginId}" does not resolve to a Plugin.');
      }
      if (p.useCases.isEmpty) errors.add('$where: useCases[] must be non-empty.');
      if (p.genreTags.isEmpty) errors.add('$where: genreTags[] must be non-empty.');
      checkSources(p.sources, where);
    }

    // Workflow Recipes.
    for (final r in data.workflowRecipes) {
      final where = 'WorkflowRecipe "${r.id}"';
      checkId(r.id, where);
      checkEnum(r.difficulty, _difficulties, where);
      if (r.timeEstimate.isEmpty) {
        errors.add('$where: timeEstimate is required.');
      }
      if (r.pluginChain.isEmpty) {
        errors.add('$where: pluginChain[] must be non-empty.');
      }
      for (final pid in r.pluginChain) {
        if (!pluginIds.contains(pid)) {
          errors.add('$where: pluginChain id "$pid" does not resolve to a Plugin.');
        }
      }
      if (r.steps.isEmpty) {
        errors.add('$where: steps[] must be non-empty.');
      } else {
        final orders = r.steps.map((s) => s.order).toList()..sort();
        for (var i = 0; i < orders.length; i++) {
          if (orders[i] != i + 1) {
            errors.add('$where: step order values must be contiguous 1..N.');
            break;
          }
        }
      }
      for (final pref in r.presetRefs) {
        if (!presetIds.contains(pref)) {
          errors.add('$where: presetRef "$pref" does not resolve to a Preset.');
        }
      }
      checkSources(r.sources, where);
    }

    // Sound Design Notes.
    for (final n in data.soundDesignNotes) {
      final where = 'SoundDesignNote "${n.id}"';
      checkId(n.id, where);
      checkEnum(n.evidenceLevel, _evidence, where);
      if (n.body.isEmpty) errors.add('$where: body must be non-empty.');
      if (n.subjectRefs.isEmpty) {
        errors.add('$where: subjectRefs[] must be non-empty.');
      }
      for (final ref in n.subjectRefs) {
        if (!pluginIds.contains(ref) && !presetIds.contains(ref)) {
          errors.add('$where: subjectRef "$ref" does not resolve to a Plugin or Preset.');
        }
      }
      checkSources(n.sources, where);
    }

    return errors;
  }
}
