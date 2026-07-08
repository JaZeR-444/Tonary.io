import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// Opens the on-device SQLite database file (native platforms). The native
/// sqlite3 library is provided at runtime by `sqlite3_flutter_libs`.
QueryExecutor openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'tonary.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
