import 'package:flutter/material.dart';

import '../../../shared/widgets/module_placeholder.dart';

/// Tonary Scout — recommendations & plugin/preset/chain matching.
class ScoutScreen extends StatelessWidget {
  const ScoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scout')),
      body: const SafeArea(
        child: ModulePlaceholder(
          title: 'Tonary Scout',
          tagline: 'Recommendations and plugin/preset/chain matching.',
          icon: Icons.travel_explore_outlined,
        ),
      ),
    );
  }
}
