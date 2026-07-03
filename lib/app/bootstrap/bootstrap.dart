import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/app_meta_repository.dart';
import '../../data/sources/drift/tonary_database.dart';
import '../../data/sources/seed/seed_loader.dart';
import '../../features/onboarding/application/onboarding_providers.dart';
import '../tonary_app.dart';
import 'providers.dart';

/// Bundled seed dataset version. Bump when `assets/seed/*.json` changes so
/// devices re-hydrate (see `assets/seed/README.md`).
/// v2: pilot migration — FLEX, Sytrus, Fruity Parametric EQ 2 from DEEPER DIVES.
/// v3: first content release — 27 reviewed plugins promoted from staging
///     (owner-authorized OQ-12 gate #5, 2026-07-02); 30 plugins total.
/// v4+: ongoing direct migration of remaining FL plugins into the seed.
const int kSeedVersion = 6;

/// App bootstrap. Runs before the first frame: opens the offline database and
/// hydrates it from the bundled seed (offline-first — the DB is the source of
/// truth). See `.claude/architecture/data-layer.md`.
Future<Widget> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  final db = TonaryDatabase();
  await SeedLoader(
    db,
  ).ensureSeeded(readAsset: rootBundle.loadString, seedVersion: kSeedVersion);

  // First run opens onboarding; thereafter, straight to Home.
  final meta = AppMetaRepositoryImpl(db);
  final onboarded = (await meta.get(onboardingCompleteKey)) == 'true';

  return ProviderScope(
    overrides: [databaseProvider.overrideWithValue(db)],
    child: TonaryApp(initialLocation: onboarded ? '/home' : '/onboarding'),
  );
}
