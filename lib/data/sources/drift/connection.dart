// Offline-first database connection, resolved per platform:
// native (dart:io + sqlite3) on mobile/desktop, Drift WASM on the web.
// Both expose `openConnection()`.
export 'connection_native.dart'
    if (dart.library.js_interop) 'connection_web.dart';
