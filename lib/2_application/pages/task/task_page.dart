import 'package:flutter/material.dart';

import '../../core/page_config.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  static const pageConfig = PageConfig(
    icon: Icons.task,
    name: 'TaskPage',
    child: TaskPage(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
    );
  }
}
