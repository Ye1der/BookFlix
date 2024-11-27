import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:book_flix/utils/widgets/custom_button.dart';
import 'package:book_flix/utils/widgets/custom_button_icon.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:book_flix/ui/screens/welcome/login_google.dart';


class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomButton(
          text: 'Get started with Google',
          icon: SvgPicture.asset('assets/img/google.svg', height: 25, width: 25),
          onTap: () async {
            // User? user = await signInWithGoogle();
            // if (user != null) {
            //   print("Inicio de sesión exitoso: ${user.displayName}");
              GoRouter.of(context).push('/home');
            // } else {
            //   print("El usuario canceló el inicio de sesión.");
            // }
          }),
      // const SizedBox(width: 15.0),
      // CustomIconButton(
      //     icon:
      //         SvgPicture.asset('assets/img/google.svg', height: 30, width: 30)),
      // const SizedBox(width: 10.0),
      // CustomIconButton(
      //     icon: SvgPicture.asset('assets/img/apple.svg', height: 30, width: 30))
    ]);
  }
}
