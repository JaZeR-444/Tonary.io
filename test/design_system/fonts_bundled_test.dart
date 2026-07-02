// Verifies the brand typefaces are actually bundled as offline assets (paths in
// pubspec resolve and the files are non-trivial TTFs). Guards against the type
// scale silently falling back to a system font.

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const fonts = <String>[
    'assets/fonts/Inter-Variable.ttf',
    'assets/fonts/SpaceGrotesk-Variable.ttf',
    'assets/fonts/IBMPlexMono-Regular.ttf',
    'assets/fonts/IBMPlexMono-Medium.ttf',
  ];

  for (final path in fonts) {
    test('bundled font asset resolves: $path', () async {
      final data = await rootBundle.load(path);
      // A real TTF is well over 1KB and starts with the sfnt magic 0x00010000.
      expect(data.lengthInBytes, greaterThan(1024));
      expect(data.getUint32(0), 0x00010000, reason: 'not a valid TTF header');
    });
  }
}
