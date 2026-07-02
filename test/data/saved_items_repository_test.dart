import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tonary/data/repositories/saved_items_repository.dart';
import 'package:tonary/data/sources/drift/tonary_database.dart';
import 'package:tonary/shared/models/enums.dart';

/// Data-layer test for saved items on a real in-memory SQLite database.
void main() {
  late TonaryDatabase db;
  setUp(() => db = TonaryDatabase.forTesting(NativeDatabase.memory()));
  tearDown(() => db.close());

  test('save / isSaved / unsave round-trip', () async {
    final repo = SavedItemsRepositoryImpl(db);

    expect(await repo.isSaved(SavedItemRefType.plugin, 'flex'), isFalse);
    expect(await repo.listSaved(), isEmpty);

    await repo.save(SavedItemRefType.plugin, 'flex');
    expect(await repo.isSaved(SavedItemRefType.plugin, 'flex'), isTrue);
    expect(await repo.listSaved(), hasLength(1));

    await repo.unsave(SavedItemRefType.plugin, 'flex');
    expect(await repo.isSaved(SavedItemRefType.plugin, 'flex'), isFalse);
    expect(await repo.listSaved(), isEmpty);
  });

  test('save is idempotent (no duplicate rows)', () async {
    final repo = SavedItemsRepositoryImpl(db);
    await repo.save(SavedItemRefType.plugin, 'flex');
    await repo.save(SavedItemRefType.plugin, 'flex');
    expect(await repo.listSaved(), hasLength(1));
  });

  test('listSaved returns newest first', () async {
    var t = DateTime.utc(2026, 1, 1);
    final repo = SavedItemsRepositoryImpl(db, now: () => t);

    await repo.save(SavedItemRefType.plugin, 'flex'); // older
    t = DateTime.utc(2026, 2, 1);
    await repo.save(SavedItemRefType.plugin, 'sytrus'); // newer

    final ids = (await repo.listSaved()).map((i) => i.refId).toList();
    expect(ids, ['sytrus', 'flex']);
  });
}
