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
            child: Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: 0.2,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        boxShadow: const [
                        BoxShadow(
                          color: CustomColors.red,
                          spreadRadius: 100,
                          blurRadius: 100,
                        )
                      ]),
                      child: const Text('404',
                          style: TextStyle(
                              fontSize: 100.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white54))
                  ),
                ),
                const Text('Page not found',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    )),
                Transform.translate(
                  offset: const Offset(0, 80),
                  child: CustomButton(
                    text: 'Go Home',
                    icon: const Icon(LucideIcons.arrowUpRight, color: Colors.white),
                    onTap: () {

                    }
                  )
                )
              ]
            )
        ));
  }
}
