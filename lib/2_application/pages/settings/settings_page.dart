import 'package:flutter/material.dart';
import 'package:udemy_todo/2_application/core/page_config.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const pageConfig = PageConfig(
    icon: Icons.settings_rounded,
    name: 'Settings',
    child: SettingsPage(),
  );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
