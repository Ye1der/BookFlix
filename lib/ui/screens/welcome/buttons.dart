import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../widgets/custom_button.dart';
import '../../colors/global_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomButton(
          text: 'Get started',
          icon: const Icon(LucideIcons.arrowUpRight, color: Colors.white),
          onTap: () {
            print('Here');
          }),
      const SizedBox(width: 15.0),
      Container(
          height: 55.0,
          width: 55.0,
          padding: const EdgeInsets.all(13.0),
          decoration: BoxDecoration(
              color: CustomColors.whiteGray,
              borderRadius: BorderRadius.circular(15.0)),
          child: SvgPicture.asset('assets/img/google.svg',
              height: 30.0, width: 30.0)),
      const SizedBox(width: 10.0),
      Container(
          height: 55.0,
          width: 55.0,
          padding: const EdgeInsets.all(13.0),
          decoration: BoxDecoration(
              color: CustomColors.whiteGray,
              borderRadius: BorderRadius.circular(15.0)),
          child: SvgPicture.asset('assets/img/apple.svg',
              height: 30.0, width: 30.0)),
    ]);
  }
}
