import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_locator/app/modules/login/login_bloc.dart';
import 'package:the_locator/app/modules/login/login_page.dart';

final LoginBloc loginBloc = LoginBloc();

class AppRouter {
  final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return LoginPage(controller: loginBloc);
        },
      ),
    ],
  );
}
