import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';

/// Opens the database on the web via Drift's WASM backend. `sqlite3.wasm` and
/// `drift_worker.js` are hosted in `web/`. Persists in IndexedDB where the
/// browser supports it, falling back to in-memory otherwise.
QueryExecutor openConnection() {
  return LazyDatabase(() async {
    final result = await WasmDatabase.open(
      databaseName: 'tonary',
      sqlite3Uri: Uri.parse('sqlite3.wasm'),
      driftWorkerUri: Uri.parse('drift_worker.js'),
    );
    return result.resolvedExecutor;
  });
}
