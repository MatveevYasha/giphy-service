import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:giphy_service/scr/feature/home/home_page.dart';
import 'package:giphy_service/scr/feature/home/widgets/details_page.dart';
import 'package:go_router/go_router.dart';

final $Router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return DetailsPage(gif: state.extra as Gif);
          },
        ),
      ],
    ),
  ],
);
