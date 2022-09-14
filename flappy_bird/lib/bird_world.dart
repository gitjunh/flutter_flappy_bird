import 'package:flame/components.dart';

class BirdWorld extends SpriteComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('bg.png');
    size = gameRef.size;
  }
}
