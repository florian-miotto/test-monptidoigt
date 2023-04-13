import 'package:flutter/material.dart';
import 'dart:async';

enum AnimationDirection { topToBottom, bottomToTop, leftToRight, rightToLeft }

class AnimFondu extends StatefulWidget {
  final Widget child;
  final int delay;
  final AnimationDirection direction;
  const AnimFondu({required this.delay, required this.child, this.direction = AnimationDirection.topToBottom});

  @override
  State<AnimFondu> createState() => _AnimFonduState();
}

class _AnimFonduState extends State<AnimFondu> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  late Animation<Offset> _offsetAnimation;

  Offset getInitialOffset() {
    switch (widget.direction) {
      case AnimationDirection.topToBottom:
        return const Offset(0.0, -0.35);
      case AnimationDirection.bottomToTop:
        return const Offset(0.0, 0.35);
      case AnimationDirection.leftToRight:
        return const Offset(-0.35, 0.0);
      case AnimationDirection.rightToLeft:
        return const Offset(0.35, 0.0);
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    final curve = CurvedAnimation(
      parent: _controller!,
      curve: Curves.decelerate,
    );

    _offsetAnimation = Tween<Offset>(
      begin: getInitialOffset(),
      end: const Offset(0.0, 0.0),
    ).animate(curve);

    Timer(Duration(milliseconds: widget.delay), () {
      _controller!.forward();
    });
  }

  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: _controller!,
        child: SlideTransition(position: _offsetAnimation, child: widget.child));
  }
}
