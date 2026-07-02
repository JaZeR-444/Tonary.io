import 'package:flutter/material.dart';

import '../../../shared/widgets/module_placeholder.dart';

/// Home / launchpad. Entry surface into the modules.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ModulePlaceholder(
          title: 'Tonary',
          tagline: 'Your dark-first sound-design intelligence layer.',
          icon: Icons.graphic_eq,
        ),
      ),
    );
  }
}
