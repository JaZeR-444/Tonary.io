// Golden tests locking key screens at 390pt in the dark theme, rendered with
// the real bundled brand fonts (MVP acceptance criterion). Regenerate with:
//   flutter test --update-goldens test/golden
//
// Note: reference PNGs are generated on the developer machine; minor
// antialiasing differences can appear across platforms without a pinned CI.

import 'package:flutter_test/flutter_test.dart';
import 'package:tonary/app/tonary_app.dart';

import 'golden_utils.dart';

Future<void> _pumpAt(WidgetTester tester, String location) async {
  useGoldenCanvas(tester);
  await tester.pumpWidget(goldenApp(location));
  await tester.pumpAndSettle();
}

void main() {
  setUpAll(loadTonaryFonts);

  testWidgets('onboarding (hero) golden', (tester) async {
    await _pumpAt(tester, '/onboarding');
    await expectLater(
      find.byType(TonaryApp),
      matchesGoldenFile('goldens/onboarding.png'),
    );
  });

  testWidgets('home hub golden', (tester) async {
    await _pumpAt(tester, '/home');
    await expectLater(
      find.byType(TonaryApp),
      matchesGoldenFile('goldens/home.png'),
    );
  });

  testWidgets('vault list golden', (tester) async {
    await _pumpAt(tester, '/vault');
    await expectLater(
      find.byType(TonaryApp),
      matchesGoldenFile('goldens/vault.png'),
    );
  });
}
