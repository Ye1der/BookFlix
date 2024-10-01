import 'package:flutter/material.dart';
import 'package:book_flix/utils/colors/global_colors.dart';

class CustomIconButton extends StatefulWidget {
  final Widget icon;
  final VoidCallback? onTap;
  const CustomIconButton({required this.icon, this.onTap, super.key});

  @override
  _CustomIconButton createState() => _CustomIconButton();
}

class _CustomIconButton extends State<CustomIconButton> {
  double _scale = 1;

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1;
    });
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.9;
      if (widget.onTap != null) widget.onTap!();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: () {
          _scale = 1;
        },
        child: AnimatedScale(
            duration: const Duration(milliseconds: 100),
            scale: _scale,
            child: Container(
                height: 55.0,
                width: 55.0,
                padding: const EdgeInsets.all(13.0),
                decoration: BoxDecoration(
                    color: CustomColors.whiteGray,
                    borderRadius: BorderRadius.circular(15.0)),
                child: widget.icon)));
  }
}
