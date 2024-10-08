import 'package:flutter/material.dart';

class CustomNavigate extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;

  CustomNavigate({required this.enterPage, required this.exitPage})
      : super(
            pageBuilder: (context, animation, _) => enterPage,
            transitionDuration: Duration(milliseconds: 500),
            reverseTransitionDuration: Duration(milliseconds: 500),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                return Stack(
                  children: <Widget>[
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.0, 0.0),
                        end: const Offset(-0.5, 0.0),
                      ).animate(
                          CurvedAnimation(
                          parent: animation,
                          curve: Curves.linearToEaseOut,
                          reverseCurve: Curves.easeInToLinear,
                        ),
                          ),
                      child: exitPage,
                    ),
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0),
                        end: Offset.zero,
                      ).animate(
                          CurvedAnimation(
                          parent: animation,
                          curve: Curves.linearToEaseOut,
                          reverseCurve: Curves.easeInToLinear,
                        ),
                          ),
                      child: enterPage,
                    )
                  ],
                );
            });
}
