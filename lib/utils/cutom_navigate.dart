import 'package:flutter/material.dart';

class CustomNavigate extends PageRouteBuilder {
  final Widget page;

  CustomNavigate(this.page)
      : super(
            pageBuilder: (context, animation, _) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1, 0.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return Stack(children: [
                SlideTransition(
                  position: offsetAnimation,
                  child: child,
                ),
              ]);
            });
}
