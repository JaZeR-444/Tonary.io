import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../design_system/colors/tonary_colors.dart';
import '../../../design_system/spacing/tonary_spacing.dart';
import '../../../shared/models/models.dart';
import '../../../shared/widgets/async_value_view.dart';
import '../../../shared/widgets/plugin_list_tile.dart';
import '../../vault/application/vault_providers.dart';
import '../application/plugin_search.dart';

/// Fast, offline search across Vault plugin records. Reached as an app-bar
/// action (not a bottom-nav tab) per `.claude/rules/mobile-first-rules.md`.
/// Reads the same seeded [vaultPluginsProvider] as Vault, so it works with no
/// network; ranking lives in [PluginSearch], not here.
class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _controller = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) => setState(() => _query = value);

  void _clear() {
    _controller.clear();
    setState(() => _query = '');
  }

  @override
  Widget build(BuildContext context) {
    final c = context.tonaryColors;
    final plugins = ref.watch(vaultPluginsProvider);
    final trimmed = _query.trim();

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          autofocus: true,
          textInputAction: TextInputAction.search,
          onChanged: _onChanged,
          decoration: InputDecoration(
            hintText: 'Search plugins…',
            border: InputBorder.none,
            // Persistent affordance; the app-bar title communicates context.
            isCollapsed: true,
          ),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          if (trimmed.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.close),
              tooltip: 'Clear search',
              onPressed: _clear,
            ),
        ],
      ),
      body: SafeArea(
        child: AsyncValueView<List<Plugin>>(
          value: plugins,
          loadingLabel: 'Indexing plugins…',
          isEmpty: (list) => list.isEmpty,
          emptyTitle: 'Nothing to search yet',
          emptyMessage: 'The curated dataset has not been seeded.',
          onRetry: () => ref.invalidate(vaultPluginsProvider),
          data: (all) {
            if (trimmed.isEmpty) {
              return const _PromptState();
            }
            final results = PluginSearch.run(all, trimmed);
            if (results.isEmpty) {
              return _NoResultsState(query: trimmed);
            }
            return ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: TonarySpacing.sm),
              itemCount: results.length,
              separatorBuilder: (_, _) =>
                  Divider(height: 1, color: c.borderSubtle),
              itemBuilder: (context, i) => PluginListTile(
                plugin: results[i],
                // Top-level detail route (not the in-shell '/vault/:id'): Search
                // lives above the shell, so it opens detail full-screen.
                onTap: () => context.push('/plugin/${results[i].id}'),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Shown before the user types — invites a query rather than a blank screen.
class _PromptState extends StatelessWidget {
  const _PromptState();

  @override
  Widget build(BuildContext context) {
    final c = context.tonaryColors;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(TonarySpacing.xl2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search, size: 40, color: c.textMuted),
            const SizedBox(height: TonarySpacing.md),
            Text('Search the Vault',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: TonarySpacing.sm),
            Text(
              'Find plugins by name, category, tag, tier, or type.',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: c.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}

/// Shown when a non-empty query matches nothing — states what happened and a
/// next step (`.claude/rules/ui-ux-rules.md` required states).
class _NoResultsState extends StatelessWidget {
  const _NoResultsState({required this.query});
  final String query;

  @override
  Widget build(BuildContext context) {
    final c = context.tonaryColors;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(TonarySpacing.xl2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search_off, size: 40, color: c.textMuted),
            const SizedBox(height: TonarySpacing.md),
            Text('No matches for “$query”',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: TonarySpacing.sm),
            Text(
              'Try a plugin name, a category like “synth”, or a tier like “free”.',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: c.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
