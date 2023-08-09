import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_locator/app/modules/login/login_bloc.dart';
import 'package:the_locator/app/modules/login/login_page.dart';
import 'package:the_locator/app/modules/main_page/main_page.dart';
import 'package:the_locator/app/modules/main_page/main_page_bloc.dart';
import 'package:the_locator/app/modules/register/register_bloc.dart';
import 'package:the_locator/app/modules/register/register_page.dart';

final LoginBloc loginBloc = LoginBloc();
final RegisterBloc registerBloc = RegisterBloc();
final MainPageBloc mainPageBloc = MainPageBloc();

class AppRouter {
  final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return LoginPage(controller: loginBloc);
        },
      ),
      GoRoute(
        path: '/register',
        builder: (BuildContext context, GoRouterState state) {
          return RegisterPage(
            controller: registerBloc,
          );
        },
      ),
      GoRoute(
        path: '/mainPage',
        builder: (BuildContext context, GoRouterState state) {
          return MainPage(
            controller: mainPageBloc,
          );
        },
      )
    ],
  );
}
