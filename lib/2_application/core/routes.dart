import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:udemy_todo/2_application/core/go_router_observer.dart';
import 'package:udemy_todo/2_application/pages/home/home_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final GoRouter routes = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home/TaskPage',
    observers: [
          GoRouterObserver(),//This helps you see what is happening under the hood
    ],
    routes: [
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) => child,
          routes: [
            GoRoute(
                path: '/home/:tab',
                builder: (context, state) => HomePage(
                  key: state.pageKey,
                  tab: state.pathParameters['tab']!,
                )
            ),
          ]
      ),
    ]
);