// Controlled vocabularies from the Tonary schemas (`.claude/schemas/`).
// Each enum exposes its wire value and a tolerant `fromWire` parser.

enum PluginTier {
  free('Free'),
  premium('Premium');

  const PluginTier(this.wire);
  final String wire;

  static PluginTier fromWire(String v) =>
      values.firstWhere((e) => e.wire == v,
          orElse: () => throw ArgumentError('Unknown PluginTier: $v'));
}

enum PluginType {
  generator('Generator'),
  effect('Effect');

  const PluginType(this.wire);
  final String wire;

  static PluginType fromWire(String v) =>
      values.firstWhere((e) => e.wire == v,
          orElse: () => throw ArgumentError('Unknown PluginType: $v'));
}

enum Difficulty {
  beginner('Beginner'),
  intermediate('Intermediate'),
  advanced('Advanced');

  const Difficulty(this.wire);
  final String wire;

  static Difficulty fromWire(String v) =>
      values.firstWhere((e) => e.wire == v,
          orElse: () => throw ArgumentError('Unknown Difficulty: $v'));
}

enum EvidenceLevel {
  verified('Verified'),
  documented('Documented'),
  community('Community'),
  inferred('Inferred');

  const EvidenceLevel(this.wire);
  final String wire;

  static EvidenceLevel fromWire(String v) =>
      values.firstWhere((e) => e.wire == v,
          orElse: () => throw ArgumentError('Unknown EvidenceLevel: $v'));
}

enum SourceType {
  officialManual('official-manual'),
  article('article'),
  video('video'),
  originalResearch('original-research');

  const SourceType(this.wire);
  final String wire;

  static SourceType fromWire(String v) =>
      values.firstWhere((e) => e.wire == v,
          orElse: () => throw ArgumentError('Unknown SourceType: $v'));
}

enum Reliability {
  high('High'),
  medium('Medium'),
  low('Low');

  const Reliability(this.wire);
  final String wire;

  static Reliability fromWire(String v) =>
      values.firstWhere((e) => e.wire == v,
          orElse: () => throw ArgumentError('Unknown Reliability: $v'));
}

/// Which record kind a User Saved Item points at.
enum SavedItemRefType {
  plugin('plugin'),
  preset('preset'),
  recipe('recipe'),
  note('note');

  const SavedItemRefType(this.wire);
  final String wire;

  static SavedItemRefType fromWire(String v) =>
      values.firstWhere((e) => e.wire == v,
          orElse: () => throw ArgumentError('Unknown SavedItemRefType: $v'));
}
