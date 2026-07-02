import 'package:flutter/material.dart';

import '../../../shared/widgets/module_placeholder.dart';

/// Tonary Briefs — fast explanations, comparisons, next-step suggestions.
class BriefsScreen extends StatelessWidget {
  const BriefsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Briefs')),
      body: const SafeArea(
        child: ModulePlaceholder(
          title: 'Tonary Briefs',
          tagline: 'Fast explanations, comparisons, and next steps.',
          icon: Icons.article_outlined,
        ),
      ),
    );
  }
}
