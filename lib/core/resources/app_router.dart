import 'package:flutter/material.dart';
import 'package:flutter_autentication/core/resources/app_routes.dart';
import 'package:flutter_autentication/presentation/home/view/home_page.dart';
import 'package:flutter_autentication/presentation/login/view/login_page.dart';
import 'package:flutter_autentication/presentation/user_registration/views/user_registration_page.dart';
import 'package:go_router/go_router.dart';

const String loginPath = '/login';
const String registerPath = '/register';
const String homePath = '/home';

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: loginPath,
    routes: [
      GoRoute(
        name: AppRoutes.loginRoute,
        path: loginPath,
        pageBuilder: (context, state) => const MaterialPage(
          child: LoginPage(),
        ),
      ),
      GoRoute(
        name: AppRoutes.userRegistrationRoute,
        path: registerPath,
        pageBuilder: (context, state) => const MaterialPage(
          child: UserRegistrationPage(),
        ),
      ),
      GoRoute(
        name: AppRoutes.homeRoute,
        path: homePath,
        pageBuilder: (context, state) => const MaterialPage(
          child: HomePage(),
        ),
      ),
    ],
  );
}
