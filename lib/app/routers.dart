import 'package:flutter_app/screens/drinks_screen.dart';
import 'package:flutter_app/screens/foods_screen.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/screens/loading_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const SplashScreen(),
      ),
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const HomeScreen(),
      ),
    ),
    GoRoute(
      path: '/food',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const FoodScreen(),
      ),
    ),
    GoRoute(
      path: '/drink',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const DrinkScreen(),
      ),
    ),
  ],
);
