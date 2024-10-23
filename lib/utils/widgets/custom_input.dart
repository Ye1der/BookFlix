import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final bool password;

  const CustomInput(
      {required this.controller,
      required this.placeholder,
      this.password = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: password,
      controller: controller,
      cursorHeight: 22.0,
      style: const TextStyle(
          fontSize: 21.0, fontWeight: FontWeight.w600, color: Colors.black),
      cursorColor: Colors.black,
      decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: const TextStyle(
              fontSize: 21.0,
              fontWeight: FontWeight.w600,
              color: Colors.black54),
          filled: true,
          fillColor: const Color(0xFFEFEFEF),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 17.0,
          )),
    );
  }
}
