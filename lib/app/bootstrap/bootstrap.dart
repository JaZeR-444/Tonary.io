import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/sources/drift/tonary_database.dart';
import '../../data/sources/seed/seed_loader.dart';
import '../tonary_app.dart';
import 'providers.dart';

/// Bundled seed dataset version. Bump when `assets/seed/*.json` changes so
/// devices re-hydrate (see `assets/seed/README.md`).
/// v2: pilot migration — FLEX, Sytrus, Fruity Parametric EQ 2 from DEEPER DIVES.
const int kSeedVersion = 2;

/// App bootstrap. Runs before the first frame: opens the offline database and
/// hydrates it from the bundled seed (offline-first — the DB is the source of
/// truth). See `.claude/architecture/data-layer.md`.
Future<Widget> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  final db = TonaryDatabase();
  await SeedLoader(db).ensureSeeded(
    readAsset: rootBundle.loadString,
    seedVersion: kSeedVersion,
  );

  return ProviderScope(
    overrides: [databaseProvider.overrideWithValue(db)],
    child: const TonaryApp(),
  );
}
