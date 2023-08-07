import 'package:flutter/material.dart';
import 'package:udemy_todo/2_application/core/page_config.dart';

class OverViewPage extends StatelessWidget {
  const OverViewPage({super.key});

  static const pageConfig = PageConfig(
    icon: Icons.work_history_rounded,
    name: 'Overview',
    child: OverViewPage(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange,
    );
  }
}
