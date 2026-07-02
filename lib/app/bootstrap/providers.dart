import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/app_meta_repository.dart';
import '../../data/repositories/saved_items_repository.dart';
import '../../data/repositories/vault_repository.dart';
import '../../data/sources/drift/tonary_database.dart';

/// The app database. Overridden in [bootstrap] with the opened instance so the
/// whole tree shares one connection.
final databaseProvider = Provider<TonaryDatabase>(
  (ref) => throw UnimplementedError('databaseProvider must be overridden'),
);

/// Read API over the curated knowledge base (Vault / Scout / Briefs / Flow).
final vaultRepositoryProvider = Provider<VaultRepository>(
  (ref) => VaultRepositoryImpl(ref.watch(databaseProvider)),
);

/// Durable key-value flags (e.g. onboarding-complete).
final appMetaRepositoryProvider = Provider<AppMetaRepository>(
  (ref) => AppMetaRepositoryImpl(ref.watch(databaseProvider)),
);

/// User Saved Items (favorites) — the one user-writable record type.
final savedItemsRepositoryProvider = Provider<SavedItemsRepository>(
  (ref) => SavedItemsRepositoryImpl(ref.watch(databaseProvider)),
);
