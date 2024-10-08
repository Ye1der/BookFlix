import 'package:flutter/material.dart';
import 'package:book_flix/utils/colors/global_colors.dart';
import 'package:book_flix/utils/widgets/custom_button.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: CustomColors.red,
                  spreadRadius: 0,
                  blurRadius: 100,
                )
              ]),
              child: const Text('404',
                  style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.red))),
          const Text('Page not found',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              )),
          CustomButton(
            text: 'Go Home',
            icon: const Icon(LucideIcons.arrowUpRight, color: Colors.white),
            onTap: () {

            }
          )
        ])));
  }
}
