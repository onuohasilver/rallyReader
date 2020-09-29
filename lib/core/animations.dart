import 'package:flutter/material.dart';

Animation<double> basicAnimationI(AnimationController animationController) {
  return Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(curve: Curves.bounceInOut, parent: animationController));
}

Animation<double> basicAnimationII(AnimationController animationController) {
  return Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(curve: Curves.bounceInOut, parent: animationController));
}

Animation<double> delayedAnimationI(AnimationController animationController) {
  return Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      curve: Interval(.5, 1.0, curve: Curves.bounceInOut),
      parent: animationController));
}

Animation<double> delayedAnimationII(AnimationController animationController) {
  return Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      curve: Interval(.5, 1.0, curve: Curves.bounceInOut),
      parent: animationController));
}

Animation<double> delayedAnimationIII(AnimationController animationController) {
  return Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      curve: Interval(.7, 1.0, curve: Curves.bounceInOut),
      parent: animationController));
}
