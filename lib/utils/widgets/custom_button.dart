import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;
  final Widget? icon;

  const CustomButton({required this.text, this.onTap, this.icon, super.key});

  @override
  _CustomButton createState() => _CustomButton();
}

class _CustomButton extends State<CustomButton> {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.9;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1;
      if (widget.onTap != null) widget.onTap!();
    });
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        child: AnimatedScale(
          duration: const Duration(milliseconds: 100),
          scale: _scale,
          child: Container(
            height: 55.0,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(15.0)),
            padding: const EdgeInsets.all(13.0),
            child: Row(children: [
              Text(widget.text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
              widget.icon != null
                  ? const SizedBox(width: 10.0)
                  : const SizedBox.shrink(),
              widget.icon != null ? widget.icon! : const SizedBox.shrink()
            ]),
          ),
        ));
  }
}
