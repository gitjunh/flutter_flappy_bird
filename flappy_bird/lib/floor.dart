import 'dart:ui';

import 'package:flame/components.dart';

class Floor extends SpriteComponent with HasGameRef {
  late double xSize;
  late double ySize;
  late double xPos;
  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('floor.png');
    size = gameRef.size;

    // xSize = gameRef.size.x * 2;
    // ySize = xSize / 168 * 56;
    // position = Vector2(0, gameRef.size.y - ySize * 0.22);
    // size = Vector2(xSize, ySize);
  }

  @override
  void update(double dt) {
    xPos -= dt * 50;
    if (xPos.abs() >= gameRef.size.x) xPos = 0;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    xSize = gameRef.size.x * 2;
    ySize = xSize / 168 * 56;
    position = Vector2(xPos, gameRef.size.y - ySize * 0.22);
    size = Vector2(xSize, ySize);
    sprite!.render(canvas);
  }
}
