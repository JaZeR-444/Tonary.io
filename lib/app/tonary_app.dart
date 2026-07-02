import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'router/app_router.dart';
import 'theme/tonary_theme.dart';

/// Root widget: a dark-first [MaterialApp.router] wired to [AppRouter].
///
/// Stateful so the router is created once per app instance rather than being a
/// shared global — production sees one, and each widget test gets a fresh
/// navigation stack (no leakage between tests).
class TonaryApp extends StatefulWidget {
  const TonaryApp({super.key, this.initialLocation = '/home'});

  /// Where the app opens. Bootstrap passes `/onboarding` on first run.
  final String initialLocation;

  @override
  State<TonaryApp> createState() => _TonaryAppState();
}

class _TonaryAppState extends State<TonaryApp> {
  late final GoRouter _router =
      AppRouter.createRouter(initialLocation: widget.initialLocation);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tonary',
      debugShowCheckedModeBanner: false,
      theme: TonaryTheme.dark(),
      // Dark-first: no light theme at launch. themeMode pinned to dark.
      darkTheme: TonaryTheme.dark(),
      themeMode: ThemeMode.dark,
      routerConfig: _router,
    );
  }
}
