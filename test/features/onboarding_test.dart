// Tests for onboarding: the controller writes the durable flag, and the flow
// (page through, or skip) completes and routes to Home. Uses in-memory fakes.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tonary/app/bootstrap/providers.dart';
import 'package:tonary/app/tonary_app.dart';
import 'package:tonary/data/repositories/app_meta_repository.dart';
import 'package:tonary/data/repositories/vault_repository.dart';
import 'package:tonary/features/onboarding/application/onboarding_providers.dart';
import 'package:tonary/shared/models/models.dart';

class _FakeAppMeta implements AppMetaRepository {
  final Map<String, String> store = {};
  @override
  Future<String?> get(String key) async => store[key];
  @override
  Future<void> set(String key, String value) async => store[key] = value;
}

class _FakeVaultRepository implements VaultRepository {
  @override
  Future<List<Plugin>> listPlugins() async => const [];
  @override
  Future<Plugin> pluginById(String id) async => throw UnimplementedError();
  @override
  Future<List<Preset>> presetsForPlugin(String pluginId) async => const [];
  @override
  Future<List<WorkflowRecipe>> listRecipes() async => const [];
  @override
  Future<List<SoundDesignNote>> notesForSubject(String subjectId) async =>
      const [];
  @override
  Future<SourceReference> sourceById(String id) async =>
      throw UnimplementedError();
}

Widget _app(_FakeAppMeta meta) => ProviderScope(
      overrides: [
        appMetaRepositoryProvider.overrideWithValue(meta),
        vaultRepositoryProvider.overrideWithValue(_FakeVaultRepository()),
      ],
      child: const TonaryApp(initialLocation: '/onboarding'),
    );

const _homeTagline = 'Your dark-first sound-design intelligence layer.';

void main() {
  test('OnboardingController.complete writes the durable flag', () async {
    final meta = _FakeAppMeta();
    await OnboardingController(meta).complete();
    expect(meta.store[onboardingCompleteKey], 'true');
  });

  testWidgets('paging to the end and Get started completes → Home',
      (tester) async {
    final meta = _FakeAppMeta();
    await tester.pumpWidget(_app(meta));
    await tester.pumpAndSettle();

    expect(find.text('Skip'), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);

    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    // Last page swaps the CTA label.
    expect(find.text('Get started'), findsOneWidget);
    await tester.tap(find.text('Get started'));
    await tester.pumpAndSettle();

    expect(find.text(_homeTagline), findsOneWidget); // landed on Home
    expect(meta.store[onboardingCompleteKey], 'true'); // flag persisted
  });

  testWidgets('Skip completes onboarding and routes to Home', (tester) async {
    final meta = _FakeAppMeta();
    await tester.pumpWidget(_app(meta));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Skip'));
    await tester.pumpAndSettle();

    expect(find.text(_homeTagline), findsOneWidget);
    expect(meta.store[onboardingCompleteKey], 'true');
  });
}
