import 'package:book_flix/ui/screens/register/my_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:book_flix/utils/widgets/custom_button.dart';
import 'package:book_flix/utils/colors/global_colors.dart';

class Register extends StatelessWidget {
  Register({super.key});

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
                      Navigator.pop(context);
                    },
                    child: const Icon(LucideIcons.cornerUpLeft, size: 30.0))),
            actions: [
              Transform.translate(
                  offset: const Offset(-20, 10),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push('/login');
                    },
                    child: const Text('Login',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ))
            ]),
        body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Welcome!!',
                            style: TextStyle(
                              color: CustomColors.red,
                              fontSize: 45.0,
                              fontWeight: FontWeight.bold,
                            )),
                        const Text('Fill out the fields \nbelow to register.',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                                height: 1.2)),
                        const SizedBox(height: 50.0),
                        MyForm()
                      ]),
                  Column(children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text('Do you already have an acount?',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54)),
                      const SizedBox(width: 5.0),
                      GestureDetector(
                          onTap: () {
                            GoRouter.of(context).push('/login');
                          },
                          child: const Text('Login',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColors.red)))
                    ]),
                    const SizedBox(height: 10.0),
                    CustomButton(
                      onTap: () {
                        GoRouter.of(context).push("/cards");
                      },
                      text: 'Register',
                      fullWith: true,
                    )
                  ])
                ])));
  }
}
