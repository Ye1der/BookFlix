import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:book_flix/utils/widgets/custom_button.dart';
import 'package:book_flix/utils/native_helper.dart';

class Register extends StatelessWidget {
  Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // automaticallyImplyLeading: false,
            title: Transform.translate(
                offset: const Offset(10, 10),
                child: const Icon(LucideIcons.cornerUpLeft, size: 30.0)),
            actions: [
              Transform.translate(
                offset: const Offset(-20, 10),
                child: const Text('Login',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              )
            ]),
        body: Column(children: [
          FutureBuilder<String>(
              future: NativeHelper.getNativeMessage(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Text('Native message: ${snapshot.data}');
                }
              })
        ]));
  }
}
