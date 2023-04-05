import 'package:flutter/material.dart';
import 'dart:async';

class AnimFondu extends StatefulWidget {
  final Widget child;
  final int delay;
  const AnimFondu({required this.delay, required this.child});

  @override
  State<AnimFondu> createState() => _AnimFonduState();
}

class _AnimFonduState extends State<AnimFondu> 
with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    final curve = CurvedAnimation(
      parent: _controller!,
      curve: Curves.decelerate,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.35),
      end: const Offset(0.0, 0.0),
    ).animate(curve);

    Timer( Duration(milliseconds: widget.delay), () {
      _controller!.forward();
    });
  }
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller!, 
      child: SlideTransition(
      position: _offsetAnimation, 
      child: widget.child));
  }
}