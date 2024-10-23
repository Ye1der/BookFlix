import 'package:book_flix/utils/colors/global_colors.dart';
import 'package:book_flix/utils/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class LoginForm extends StatefulWidget {
  LoginForm({super.key});

  @override
  _Form createState() => _Form();
}

class _Form extends State<LoginForm> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  bool _showPssword = false;
  double _sizeBox = 0;

  @override
  void dispose() {
    _user.dispose();
    _password.dispose();
    super.dispose();
  }

  void _handlePasswordVisibility() {
    setState(() {
      _showPssword = !_showPssword;
      _sizeBox = _showPssword ? 68.0 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomInput(controller: _user, placeholder: 'Phone, Email or Username'),
      const SizedBox(height: 15.0),
      Row(children: [
        SizedBox(
          width: 275.0,
          child: CustomInput(
              controller: _password,
              placeholder: 'Contraseña',
              password: !_showPssword),
        ),
        const SizedBox(width: 8.0),
        GestureDetector(
            onTap: _handlePasswordVisibility,
            child: Stack(alignment: Alignment.center, children: [
              Container(
                  height: 68.0,
                  width: 68.0,
                  decoration: BoxDecoration(
                      color: const Color(0xFFEFEFEF),
                      borderRadius: BorderRadius.circular(20.0))),
              AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  height: _sizeBox,
                  width: _sizeBox,
                  decoration: BoxDecoration(
                      color: CustomColors.red,
                      borderRadius: BorderRadius.circular(20.0))),
              Icon(
                _showPssword ? LucideIcons.eye : LucideIcons.eyeOff,
                size: 28.0,
                color: _showPssword ? Colors.white : Colors.black
              )
            ]))
      ]),
    ]);
  }
}
