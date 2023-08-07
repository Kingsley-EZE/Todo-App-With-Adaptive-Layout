import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:udemy_todo/2_application/pages/dashboard/dashboard_page.dart';
import 'package:udemy_todo/2_application/pages/overview/overview_page.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:udemy_todo/2_application/pages/task/task_page.dart';

class HomePage extends StatefulWidget {
   HomePage({
    super.key,
    required String tab,
  }) : index = tabs.indexWhere((element) => element.name == tab);

  final int index;

  static const tabs = [
    DashBoardPage.pageConfig,
    OverViewPage.pageConfig,
    TaskPage.pageConfig,
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final destinations = HomePage.tabs.map((page) =>
      NavigationDestination(icon: Icon(page.icon), label: page.name)).toList();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: AdaptiveLayout(
          primaryNavigation: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.mediumAndUp: SlotLayout.from(
                  key: const Key('primary-navigation-medium'),
                  builder: (context) => AdaptiveScaffold.standardNavigationRail(
                      selectedLabelTextStyle: TextStyle(color: theme.colorScheme.onBackground),
                      selectedIconTheme: IconThemeData(color: theme.colorScheme.onBackground),
                      selectedIndex: widget.index,
                      onDestinationSelected: (index) => _tapOnNavigationDestination(context, index),
                      destinations: destinations.map((_) => AdaptiveScaffold.toRailDestination(_)).toList()
                  ),
              ),
            },
          ),
          bottomNavigation: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.small: SlotLayout.from(
                  key: const Key('bottom-navigation-small'),
                  builder: (_) => AdaptiveScaffold.standardBottomNavigationBar(
                      currentIndex: widget.index,
                      onDestinationSelected: (value) => _tapOnNavigationDestination(context, value),
                      destinations: destinations,
                  ),
              ),
            },
          ),
          body: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.smallAndUp: SlotLayout.from(
                  key: const Key('primary-body-small'),
                  builder: (_) => HomePage.tabs[widget.index].child,
              ),
            },
          ),
          secondaryBody: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.mediumAndUp: SlotLayout.from(
                key: const Key('secondary-body-medium'),
                builder: AdaptiveScaffold.emptyBuilder,
              ),
            },
          ),
        ),
      ),
    );
  }

  void _tapOnNavigationDestination(BuildContext context, int index) => context.go('/home/${HomePage.tabs[index].name}');
}
