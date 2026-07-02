import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/bootstrap/providers.dart';
import '../../../data/repositories/app_meta_repository.dart';

/// AppMeta key marking that first-run onboarding has been completed.
const onboardingCompleteKey = 'onboardingComplete';

/// Whether onboarding has been completed (durable, read from AppMeta). Used by
/// bootstrap to pick the initial route; also re-readable in-app.
final onboardingCompleteProvider = FutureProvider<bool>((ref) async {
  final value = await ref.watch(appMetaRepositoryProvider).get(onboardingCompleteKey);
  return value == 'true';
});

/// Marks onboarding complete. Kept behind a controller so the widget layer
/// dispatches intent rather than writing storage directly.
class OnboardingController {
  OnboardingController(this._repo);
  final AppMetaRepository _repo;

  Future<void> complete() => _repo.set(onboardingCompleteKey, 'true');
}

final onboardingControllerProvider = Provider<OnboardingController>(
  (ref) => OnboardingController(ref.watch(appMetaRepositoryProvider)),
);
