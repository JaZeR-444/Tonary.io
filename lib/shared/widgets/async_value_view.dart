import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../design_system/colors/tonary_colors.dart';
import '../../design_system/spacing/tonary_spacing.dart';

/// Renders an [AsyncValue] with the required states (loading / error / empty /
/// data) so no screen ships a frozen blank or an uncaught error
/// (`.claude/rules/ui-ux-rules.md`).
class AsyncValueView<T> extends StatelessWidget {
  const AsyncValueView({
    super.key,
    required this.value,
    required this.data,
    this.onRetry,
    this.isEmpty,
    this.emptyTitle = 'Nothing here yet',
    this.emptyMessage = 'There is no data to show.',
    this.loadingLabel = 'Loading…',
  });

  final AsyncValue<T> value;
  final Widget Function(T data) data;
  final VoidCallback? onRetry;

  /// Optional predicate to render the empty state for a loaded-but-empty result.
  final bool Function(T data)? isEmpty;
  final String emptyTitle;
  final String emptyMessage;
  final String loadingLabel;

  @override
  Widget build(BuildContext context) {
    return value.when(
      loading: () => _Loading(label: loadingLabel),
      error: (err, _) => _ErrorState(message: '$err', onRetry: onRetry),
      data: (d) {
        if (isEmpty?.call(d) ?? false) {
          return _EmptyState(title: emptyTitle, message: emptyMessage);
        }
        return data(d);
      },
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    final c = context.tonaryColors;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Cyan = system/loading (color law).
          CircularProgressIndicator(color: c.accentInfo),
          const SizedBox(height: TonarySpacing.lg),
          Text(label,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: c.textSecondary)),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.title, required this.message});
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    final c = context.tonaryColors;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(TonarySpacing.xl2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.inbox_outlined, size: 40, color: c.textMuted),
            const SizedBox(height: TonarySpacing.md),
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: TonarySpacing.sm),
            Text(message,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: c.textSecondary)),
          ],
        ),
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message, this.onRetry});
  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final c = context.tonaryColors;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(TonarySpacing.xl2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Red is reserved for exceptional/blocking states (color law).
            Icon(Icons.error_outline, size: 40, color: c.accentDanger),
            const SizedBox(height: TonarySpacing.md),
            Text('Something went wrong',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: TonarySpacing.sm),
            Text(message,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: c.textSecondary)),
            if (onRetry != null) ...[
              const SizedBox(height: TonarySpacing.lg),
              OutlinedButton(onPressed: onRetry, child: const Text('Retry')),
            ],
          ],
        ),
      ),
    );
  }
}
