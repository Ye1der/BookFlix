import 'package:flutter/material.dart';
import 'package:first_app/ui/screens/welcome/welcome_screen.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFFF9F9F9),
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: Welcome());
  }
}
