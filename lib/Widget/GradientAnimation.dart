import 'package:flutter/material.dart';

class GradientAnimation {
  late AnimationController controller;
  late Animation<Alignment> topAlignmentAnimation;
  late Animation<Alignment> bottomAlignmentAnimation;

  GradientAnimation({required TickerProvider vsync}) {
    controller = AnimationController(vsync: vsync, duration: const Duration(seconds: 40));

    topAlignmentAnimation = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(tween: Tween<Alignment>(begin: Alignment.topLeft, end: Alignment.topRight), weight: 1),
      TweenSequenceItem<Alignment>(tween: Tween<Alignment>(begin: Alignment.topRight, end: Alignment.bottomRight), weight: 1),
      TweenSequenceItem<Alignment>(tween: Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.bottomLeft), weight: 1),
      TweenSequenceItem<Alignment>(tween: Tween<Alignment>(begin: Alignment.bottomLeft, end: Alignment.topLeft), weight: 1),
    ]).animate(controller);

    bottomAlignmentAnimation = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(tween: Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.bottomLeft), weight: 1),
      TweenSequenceItem<Alignment>(tween: Tween<Alignment>(begin: Alignment.bottomLeft, end: Alignment.topLeft), weight: 1),
      TweenSequenceItem<Alignment>(tween: Tween<Alignment>(begin: Alignment.topLeft, end: Alignment.topRight), weight: 1),
      TweenSequenceItem<Alignment>(tween: Tween<Alignment>(begin: Alignment.topRight, end: Alignment.bottomRight), weight: 1),
    ]).animate(controller);

    controller.repeat();
  }

  void dispose() {
    controller.dispose();
  }
}
