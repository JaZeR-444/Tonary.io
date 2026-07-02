import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../design_system/colors/tonary_colors.dart';
import '../../../design_system/spacing/tonary_spacing.dart';
import '../application/onboarding_providers.dart';

/// First-run onboarding — a short, skippable intro. Completing (or skipping)
/// records the durable flag and routes to Home. Mobile-first, thumb-reachable
/// CTA, honours reduced motion (`.claude/rules/mobile-first-rules.md`).
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _controller = PageController();
  int _page = 0;

  static const _pages = <_OnboardPageData>[
    _OnboardPageData(
      icon: Icons.graphic_eq,
      title: 'Tonary',
      body: 'Your dark-first sound-design intelligence layer for FL Studio — '
          'organized, understood, and always offline.',
      hero: true,
    ),
    _OnboardPageData(
      icon: Icons.inventory_2_outlined,
      title: 'Organize what you know',
      body: 'Browse and search a curated Vault of plugin, preset and chain '
          'records — every fact traceable to its source.',
    ),
    _OnboardPageData(
      icon: Icons.compare_arrows,
      title: 'Understand and compare',
      body: 'Scout matches plugins to your goal and Briefs compares them side '
          'by side — evidence-backed, no guesswork.',
    ),
  ];

  bool get _isLast => _page == _pages.length - 1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _finish() async {
    await ref.read(onboardingControllerProvider).complete();
    ref.invalidate(onboardingCompleteProvider);
    if (mounted) context.go('/home');
  }

  void _next() {
    if (_isLast) {
      _finish();
      return;
    }
    final target = _page + 1;
    // Honour reduced motion: jump instead of animating.
    if (MediaQuery.of(context).disableAnimations) {
      _controller.jumpToPage(target);
    } else {
      _controller.animateToPage(
        target,
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(TonarySpacing.lg),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _finish,
                  child: const Text('Skip'),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: _pages.length,
                  onPageChanged: (i) => setState(() => _page = i),
                  itemBuilder: (context, i) => _OnboardPage(data: _pages[i]),
                ),
              ),
              const SizedBox(height: TonarySpacing.lg),
              _Dots(count: _pages.length, active: _page),
              const SizedBox(height: TonarySpacing.lg),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _next,
                  child: Text(_isLast ? 'Get started' : 'Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardPageData {
  const _OnboardPageData({
    required this.icon,
    required this.title,
    required this.body,
    this.hero = false,
  });
  final IconData icon;
  final String title;
  final String body;
  final bool hero;
}

class _OnboardPage extends StatelessWidget {
  const _OnboardPage({required this.data});
  final _OnboardPageData data;

  @override
  Widget build(BuildContext context) {
    final c = context.tonaryColors;
    // Display face (Space Grotesk) only for the hero wordmark.
    final titleStyle = data.hero
        ? Theme.of(context).textTheme.displaySmall
        : Theme.of(context).textTheme.headlineSmall;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(data.icon, size: 56, color: c.accentInfo),
          const SizedBox(height: TonarySpacing.xl2),
          Text(data.title, style: titleStyle, textAlign: TextAlign.center),
          const SizedBox(height: TonarySpacing.md),
          Text(
            data.body,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: c.textSecondary),
          ),
        ],
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({required this.count, required this.active});
  final int count;
  final int active;

  @override
  Widget build(BuildContext context) {
    final c = context.tonaryColors;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < count; i++)
          Container(
            width: i == active ? 20 : 8,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: TonarySpacing.xs),
            decoration: BoxDecoration(
              color: i == active ? c.accentInfo : c.outlineControl,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
      ],
    );
  }
}
