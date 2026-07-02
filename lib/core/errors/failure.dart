/// Typed failures for the data layer (see `.claude/architecture/data-layer.md`).
/// Repositories return/raise these instead of leaking raw exceptions.
sealed class Failure implements Exception {
  const Failure(this.message);
  final String message;
  @override
  String toString() => '$runtimeType: $message';
}

/// A requested record was not found.
class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message);
}

/// Generic storage/read failure.
class StorageFailure extends Failure {
  const StorageFailure(super.message);
}

/// Raised when the bundled seed dataset fails validation. Fail closed — invalid
/// records must never enter the database (`.claude/rules/data-modeling-rules.md`).
class SeedValidationException implements Exception {
  SeedValidationException(this.errors);

  /// One human-readable message per validation violation.
  final List<String> errors;

  @override
  String toString() =>
      'SeedValidationException (${errors.length} error(s)):\n- ${errors.join('\n- ')}';
}
