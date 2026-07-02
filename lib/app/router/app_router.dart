import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../design_system/colors/tonary_colors.dart';
import '../../features/briefs/presentation/briefs_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/scout/presentation/scout_screen.dart';
import '../../features/search/presentation/search_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/vault/presentation/plugin_detail_screen.dart';
import '../../features/vault/presentation/vault_screen.dart';

/// App routing (go_router). A [StatefulShellRoute] preserves per-tab navigation
/// state behind a mobile-first bottom navigation bar.
///
/// Tabs reflect the confirmed MVP (D-011): Home, Vault, Scout, Briefs, Settings.
/// See `.claude/architecture/navigation-architecture.md`.
final class AppRouter {
  AppRouter._();

  /// Builds a fresh router. [TonaryApp] creates one per instance (once in
  /// production; fresh per widget test) so navigation state never leaks between
  /// tests — see `.claude/rules/qa-rules.md`.
  static GoRouter createRouter() => GoRouter(
    initialLocation: '/home',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            _RootShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(path: '/home', builder: (_, _) => const HomeScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/vault',
              builder: (_, _) => const VaultScreen(),
              routes: [
                GoRoute(
                  path: ':id',
                  builder: (_, state) => PluginDetailScreen(
                    pluginId: state.pathParameters['id']!,
                  ),
                ),
              ],
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: '/scout', builder: (_, _) => const ScoutScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: '/briefs', builder: (_, _) => const BriefsScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
                path: '/settings', builder: (_, _) => const SettingsScreen()),
          ]),
        ],
      ),
      // Search is a full-screen route above the shell (not a 6th tab), reached
      // from the Vault app bar — see `.claude/rules/mobile-first-rules.md`.
      GoRoute(path: '/search', builder: (_, _) => const SearchScreen()),
      // Plugin detail as a top-level route for entry points outside the Vault
      // shell branch (e.g. Search). Vault's own list uses the in-shell
      // '/vault/:id' so it keeps the bottom nav; pushing that from above the
      // shell would duplicate the branch's page keys.
      GoRoute(
        path: '/plugin/:id',
        builder: (_, state) =>
            PluginDetailScreen(pluginId: state.pathParameters['id']!),
      ),
    ],
  );
}

class _NavTab {
  const _NavTab(this.icon, this.selectedIcon, this.label);
  final IconData icon;
  final IconData selectedIcon;
  final String label;
}

const _tabs = <_NavTab>[
  _NavTab(Icons.home_outlined, Icons.home, 'Home'),
  _NavTab(Icons.inventory_2_outlined, Icons.inventory_2, 'Vault'),
  _NavTab(Icons.travel_explore_outlined, Icons.travel_explore, 'Scout'),
  _NavTab(Icons.article_outlined, Icons.article, 'Briefs'),
  _NavTab(Icons.settings_outlined, Icons.settings, 'Settings'),
];

class _RootShell extends StatelessWidget {
  const _RootShell({required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final colors = context.tonaryColors;
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: colors.outlineControl)),
        ),
        child: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: (index) => navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          ),
          destinations: [
            for (final tab in _tabs)
              NavigationDestination(
                icon: Icon(tab.icon),
                selectedIcon: Icon(tab.selectedIcon),
                label: tab.label,
              ),
          ],
        ),
      ),
    );
  }
}
