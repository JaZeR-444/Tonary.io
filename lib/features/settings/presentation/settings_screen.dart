import 'package:flutter/material.dart';

import '../../../shared/widgets/module_placeholder.dart';

/// Settings — theme, data/seed management, about, accessibility.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const SafeArea(
        child: ModulePlaceholder(
          title: 'Settings',
          tagline: 'Theme, data & seed management, about, accessibility.',
          icon: Icons.settings_outlined,
        ),
      ),
    );
  }
}
