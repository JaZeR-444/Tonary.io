import 'package:flutter/material.dart';

import 'router/app_router.dart';
import 'theme/tonary_theme.dart';

/// Root widget: a dark-first [MaterialApp.router] wired to [AppRouter].
class TonaryApp extends StatelessWidget {
  const TonaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tonary',
      debugShowCheckedModeBanner: false,
      theme: TonaryTheme.dark(),
      // Dark-first: no light theme at launch. themeMode pinned to dark.
      darkTheme: TonaryTheme.dark(),
      themeMode: ThemeMode.dark,
      routerConfig: AppRouter.router,
    );
  }
}
