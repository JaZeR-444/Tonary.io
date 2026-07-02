import 'package:drift/drift.dart' show OrderingTerm, OrderingMode;

import '../../shared/models/enums.dart';
import '../../shared/models/models.dart';
import '../sources/drift/tonary_database.dart';

/// Read/write access to User Saved Items — the one user-writable record type
/// (`.claude/schemas/user-session.schema.md`). Seeding never touches this table.
abstract interface class SavedItemsRepository {
  Future<List<SavedItem>> listSaved();
  Future<bool> isSaved(SavedItemRefType refType, String refId);

  /// Idempotent: saving an already-saved item is a no-op.
  Future<void> save(SavedItemRefType refType, String refId);
  Future<void> unsave(SavedItemRefType refType, String refId);
}

class SavedItemsRepositoryImpl implements SavedItemsRepository {
  SavedItemsRepositoryImpl(this._db, {DateTime Function()? now})
    : _now = now ?? DateTime.now;

  final TonaryDatabase _db;
  final DateTime Function() _now;

  @override
  Future<List<SavedItem>> listSaved() async {
    final rows =
        await (_db.select(_db.savedItems)..orderBy([
              (t) =>
                  OrderingTerm(expression: t.savedAt, mode: OrderingMode.desc),
            ]))
            .get();
    return rows.map(_toDomain).toList();
  }

  @override
  Future<bool> isSaved(SavedItemRefType refType, String refId) async {
    final row = await _find(refType, refId);
    return row != null;
  }

  @override
  Future<void> save(SavedItemRefType refType, String refId) async {
    if (await _find(refType, refId) != null) return; // already saved
    await _db
        .into(_db.savedItems)
        .insert(
          SavedItemsCompanion.insert(
            refType: refType.wire,
            refId: refId,
            savedAt: _now().toUtc().toIso8601String(),
          ),
        );
  }

  @override
  Future<void> unsave(SavedItemRefType refType, String refId) async {
    // Multiple where() calls are combined with AND by Drift.
    await (_db.delete(_db.savedItems)
          ..where((t) => t.refType.equals(refType.wire))
          ..where((t) => t.refId.equals(refId)))
        .go();
  }

  Future<SavedItemRow?> _find(SavedItemRefType refType, String refId) =>
      (_db.select(_db.savedItems)
            ..where((t) => t.refType.equals(refType.wire))
            ..where((t) => t.refId.equals(refId))
            ..limit(1))
          .getSingleOrNull();

  SavedItem _toDomain(SavedItemRow r) => SavedItem(
    rowId: r.rowId,
    refType: SavedItemRefType.fromWire(r.refType),
    refId: r.refId,
    savedAt: r.savedAt,
  );
}
