import '../sources/drift/tonary_database.dart';

/// Read/write access to the app's key-value markers (the `AppMeta` table) —
/// small durable flags like the onboarding-complete marker. The seed version
/// guard uses the same table (`.claude/architecture/data-layer.md`).
abstract interface class AppMetaRepository {
  Future<String?> get(String key);
  Future<void> set(String key, String value);
}

class AppMetaRepositoryImpl implements AppMetaRepository {
  AppMetaRepositoryImpl(this._db);

  final TonaryDatabase _db;

  @override
  Future<String?> get(String key) async {
    final row = await (_db.select(
      _db.appMeta,
    )..where((t) => t.key.equals(key))).getSingleOrNull();
    return row?.value;
  }

  @override
  Future<void> set(String key, String value) async {
    await _db
        .into(_db.appMeta)
        .insertOnConflictUpdate(
          AppMetaCompanion.insert(key: key, value: value),
        );
  }
}
