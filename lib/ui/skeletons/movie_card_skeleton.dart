import 'package:flutter/material.dart';

class MovieCardSkeleton extends StatefulWidget {
  @override
  _MovieCardSkeleton createState() => _MovieCardSkeleton();
}

class _MovieCardSkeleton extends State<MovieCardSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this)
          ..repeat(reverse: true);
    _animation = Tween(begin: 1.0, end: 0.3).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 220, 220, 220),
            borderRadius: BorderRadius.circular(30.0)),
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: FadeTransition(
                opacity: _animation,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          height: 20,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(2))),
                      const SizedBox(height: 12),
                      Container(
                          height: 10,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(2))),
                      const SizedBox(height: 8),
                      Container(
                          height: 10,
                          width: 260,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(2))),
                      const SizedBox(height: 8),
                      Container(
                          height: 10,
                          width: 280,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(2)))
                    ]))));
  }
}
