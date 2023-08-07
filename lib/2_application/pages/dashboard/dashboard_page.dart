import 'package:flutter/material.dart';
import 'package:udemy_todo/2_application/core/page_config.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  static const pageConfig = PageConfig(
      icon: Icons.dashboard_rounded,
      name: 'Dashboard',
      child: DashBoardPage(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
    );
  }
}
