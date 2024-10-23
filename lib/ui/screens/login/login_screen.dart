import 'package:book_flix/ui/screens/login/login_form.dart';
import 'package:book_flix/utils/colors/global_colors.dart';
import 'package:book_flix/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: CustomColors.background,
        appBar: AppBar(
            backgroundColor: CustomColors.background,
            automaticallyImplyLeading: false,
            title: Transform.translate(
                offset: const Offset(10, 10),
                child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pop();
                    },
                    child: const Icon(LucideIcons.cornerUpLeft, size: 30.0))),
            ),
        body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Welcome back!!',
                            style: TextStyle(
                              color: CustomColors.red,
                              fontSize: 44.0,
                              fontWeight: FontWeight.bold,
                            )),
                        const Text('You’ve been missed.',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 37.0,
                                fontWeight: FontWeight.bold,
                                height: 1.2)),
                        const SizedBox(height: 50.0),
                        LoginForm()
                      ]),
                  Column(children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text("Don't have an acount?",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54)),
                      const SizedBox(width: 5.0),
                      GestureDetector(
                          onTap: () {
                            GoRouter.of(context).pop();
                          },
                          child: const Text('Register',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColors.red)))
                    ]),
                    const SizedBox(height: 10.0),
                    const CustomButton(
                      text: 'Login',
                      fullWith: true,
                    )
                  ])
                ])));
  }
}
