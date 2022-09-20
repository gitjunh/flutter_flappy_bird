import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/painting.dart';

class Bg extends ParallaxComponent {
  Bg(ParallaxComponent image, Vector2 size) : super(size: size) {}

  stopMovement() {
    parallax?.baseVelocity = Vector2.zero();
  }

  restartMovement() {
    parallax?.baseVelocity = Vector2(100.0, 0.0);
  }
}
