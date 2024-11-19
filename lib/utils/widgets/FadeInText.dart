import 'package:flutter/material.dart';

class FadeInText extends StatefulWidget {
  final Widget text;

  const FadeInText({Key? key, required this.text}) : super(key: key);

  @override
  _FadeInTextState createState() => _FadeInTextState();
}

class _FadeInTextState extends State<FadeInText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    // Crea el AnimationController con una duración de 1 segundo.
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();  // Inicia la animación inmediatamente.

    // Define el Tween que va de 0 (invisible) a 1 (totalmente visible).
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
  }

  @override
  void dispose() {
    _controller.dispose();  // Libera el controlador cuando ya no se use.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,  // Asocia la animación de opacidad al FadeTransition.
      child: widget.text,
    );
  }
}
