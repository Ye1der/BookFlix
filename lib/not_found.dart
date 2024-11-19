import 'package:flutter/material.dart';
import 'package:book_flix/utils/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: CustomButton(
                text: '404 page not found',
                icon: const Icon(LucideIcons.arrowUpRight, color: Colors.white),
                onTap: () {
                  GoRouter.of(context).pop();
                })));
  }
}
