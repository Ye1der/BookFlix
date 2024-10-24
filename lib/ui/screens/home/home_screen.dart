import 'package:book_flix/ui/screens/home/swiper_cards.dart';
import 'package:book_flix/utils/colors/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.background,
        appBar: AppBar(
            backgroundColor: CustomColors.background,
            automaticallyImplyLeading: false,
            toolbarHeight: 50.0,
            actions: [
              GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push('/favorites');
                  },
                  child: const Icon(Icons.favorite,
                      size: 30.0, color: CustomColors.red)),
              const SizedBox(width: 15.0)
            ]),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Swiper()])));
  }
}
