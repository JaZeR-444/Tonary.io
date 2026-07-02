import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../design_system/colors/tonary_colors.dart';
import '../../../design_system/spacing/tonary_spacing.dart';
import '../application/settings_providers.dart';

/// Settings — grounded, read-mostly: appearance (dark-first, locked for launch),
/// the offline dataset summary, accessibility status (Tonary follows the
/// system, no fake toggles), and about. No fabricated values.
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final media = MediaQuery.of(context);
    final reducedMotion = media.disableAnimations;
    final textScale = media.textScaler.scale(1.0);
    final seedVersion = ref.watch(seedVersionProvider);
    final summary = ref.watch(datasetSummaryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: TonarySpacing.md),
          children: [
            _Section(
              title: 'Appearance',
              children: [
                _SettingRow(
                  icon: Icons.dark_mode_outlined,
                  title: 'Theme',
                  value: 'Dark',
                  subtitle: 'Dark-first — locked for launch.',
                ),
              ],
            ),
            _Section(
              title: 'Dataset',
              children: [
                _SettingRow(
                  icon: Icons.dataset_outlined,
                  title: 'Seed version',
                  value: 'v$seedVersion',
                  subtitle: 'Bundled and read fully offline.',
                ),
                summary.when(
                  loading: () => const _SettingRow(
                    icon: Icons.inventory_2_outlined,
                    title: 'Records',
                    value: '…',
                  ),
                  error: (_, _) => const _SettingRow(
                    icon: Icons.inventory_2_outlined,
                    title: 'Records',
                    value: 'unavailable',
                  ),
                  data: (s) => _SettingRow(
                    icon: Icons.inventory_2_outlined,
                    title: 'Records',
                    value:
                        '${s.pluginCount} plugins · ${s.recipeCount} recipes',
                  ),
                ),
              ],
            ),
            _Section(
              title: 'Accessibility',
              children: [
                _SettingRow(
                  icon: Icons.motion_photos_paused_outlined,
                  title: 'Reduced motion',
                  value: reducedMotion ? 'On' : 'Off',
                  subtitle: 'Follows your system setting.',
                ),
                _SettingRow(
                  icon: Icons.format_size,
                  title: 'Text size',
                  value: '${(textScale * 100).round()}%',
                  subtitle: 'Scales with your system font size.',
                ),
              ],
            ),
            _Section(
              title: 'About',
              children: [
                _SettingRow(
                  icon: Icons.graphic_eq,
                  title: 'Tonary',
                  value: '',
                  subtitle:
                      'A dark-first sound-design intelligence layer for FL '
                      'Studio producers. Offline-first · single-device · no '
                      'account.',
                ),
                _SettingRow(
                  icon: Icons.info_outline,
                  title: 'Not affiliated',
                  value: '',
                  subtitle:
                      'Tonary is independent — not affiliated with, endorsed '
                      'by, or sponsored by Image-Line. “FL Studio” and '
                      '“Image-Line” are trademarks of their respective owners, '
                      'used here only to describe compatibility.',
                ),
                _SettingRow(
                  icon: Icons.verified_outlined,
                  title: 'Sources',
                  value: '',
                  subtitle:
                      'Plugin facts are re-stated in Tonary’s own words and '
                      'cite their sources; Tonary does not reproduce manuals '
                      'or ship factory preset files.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// A titled group of setting rows.
class _Section extends StatelessWidget {
  const _Section({required this.title, required this.children});
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final c = context.tonaryColors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            TonarySpacing.lg,
            TonarySpacing.lg,
            TonarySpacing.lg,
            TonarySpacing.sm,
          ),
          child: Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: c.textSecondary,
              letterSpacing: 0.8,
            ),
          ),
        ),
        ...children,
      ],
    );
  }
}

/// One read-only setting: leading icon, title, optional trailing value + subtitle.
class _SettingRow extends StatelessWidget {
  const _SettingRow({
    required this.icon,
    required this.title,
    required this.value,
    this.subtitle,
  });

  final IconData icon;
  final String title;
  final String value;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final c = context.tonaryColors;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: TonarySpacing.lg,
        vertical: TonarySpacing.sm,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: c.textSecondary),
          const SizedBox(width: TonarySpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    if (value.isNotEmpty)
                      Text(
                        value,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: c.textSecondary,
                        ),
                      ),
                  ],
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: TonarySpacing.xs),
                  Text(
                    subtitle!,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: c.textMuted),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
