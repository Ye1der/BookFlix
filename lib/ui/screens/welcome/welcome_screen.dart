import 'package:flutter/material.dart';
import './covers.dart';
import './sentence.dart';
import './buttons.dart';
import 'package:book_flix/utils/colors/global_colors.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.background,
        appBar: AppBar(
            backgroundColor: CustomColors.background,
            toolbarHeight: 50.0,
            automaticallyImplyLeading: false,
            title: const Text('BookFlix',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ))),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Covers(),
          const SizedBox(height: 20.0),
          const Sentence(),
          const SizedBox(height: 40.0),
          const Buttons(),
          const SizedBox(height: 15.0),
          // RichText(
          //     text: const TextSpan(children: [
          //   TextSpan(
          //       text: 'Do you already have an acount?',
          //       style: TextStyle(
          //           color: CustomColors.gray, fontWeight: FontWeight.bold)),
          //   TextSpan(
          //       text: ' Login',
          //       style: TextStyle(
          //           color: CustomColors.red, fontWeight: FontWeight.bold)),
          // ])),
          const SizedBox(height: 20.0)
        ])));
  }
}
