import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:book_flix/utils/widgets/custom_button.dart';
import 'package:book_flix/utils/native_helper.dart';
import 'package:book_flix/utils/colors/global_colors.dart';

class Register extends StatelessWidget {
  Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.background,
        appBar: AppBar(
            backgroundColor: CustomColors.background,
            automaticallyImplyLeading: false,
            title: Transform.translate(
                offset: const Offset(10, 10),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(LucideIcons.cornerUpLeft, size: 30.0))),
            actions: [
              Transform.translate(
                offset: const Offset(-20, 10),
                child: const Text('Login',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              )
            ]),
        body: const Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(children: [Text('Welcome!!', style: TextStyle(
            color: CustomColors.red,
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
          ))])
        )
    );
  }
}
