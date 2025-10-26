import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_home/features/auth/presentation/pages/login_screen.dart';
import 'package:my_home/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:my_home/features/onboarding/presentation/pages/on_boarding_screen.dart';
import 'package:my_home/features/splash/presentation/pages/splash_screen.dart';
import 'package:my_home/main_scaffold.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onBoarding',
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signUp',
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: '/mainScaffold',
        builder: (context, state) => const MainScaffold(),
      ),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
