import 'package:book_flix/ui/screens/details_movie/details_movie_screen.dart';
import 'package:book_flix/ui/screens/favorites/favorites_screen.dart';
import 'package:book_flix/ui/screens/home/home_screen.dart';
import 'package:book_flix/ui/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './ui/screens/welcome/welcome_screen.dart';
import './ui/screens/register/register_screen.dart';
import './not_found.dart';
import './main.dart';

mixin RouterMixin on State<Root> {
  final _router = GoRouter(
    initialLocation: '/',
    errorBuilder: (context, state) => const NotFound(),
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => _buildTransitionPage(
          child: const Welcome(),
          state: state,
        ),
      ),
      GoRoute(
        path: '/register',
        pageBuilder: (context, state) => _buildTransitionPage(
          child: Register(),
          state: state,
        ),
      ),
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) => _buildTransitionPage(
          child: const Login(),
          state: state,
        ),
      ),
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) => _buildTransitionPage(
          child: Home(),
          state: state,
        ),
      ),
      GoRoute(
        path: '/favorites',
        pageBuilder: (context, state) => _buildTransitionPage(
          child: FavoritesScreen(),
          state: state,
        ),
      ),
      GoRoute(
        path: '/movie_details/:imgUrl',
        pageBuilder: (context, state) {
          final imgUrl = state.pathParameters['imgUrl'] ?? '';

          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            reverseTransitionDuration: const Duration(milliseconds: 500),
            key: state.pageKey,
            child: MovieDetails(imgUrl: imgUrl),
            transitionsBuilder: (context, animation, _, child) {
              return FadeTransition(
                  opacity: Tween(begin: 0.0, end: 1.0).animate(animation),
                  child: child);
            },
          );
        },
      )
    ],
  );

  GoRouter get router => _router;

  static CustomTransitionPage _buildTransitionPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 450),
      reverseTransitionDuration: const Duration(milliseconds: 450),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Definimos una animación personalizada (Slide hacia la derecha)
        const begin = Offset(1.0, 0.0); // Desde la derecha
        const end = Offset.zero; // Hacia el centro
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
