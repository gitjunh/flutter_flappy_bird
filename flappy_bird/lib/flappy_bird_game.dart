import 'package:flame/game.dart';
import 'package:flappy_bird/bird.dart';
import 'package:flappy_bird/bird_world.dart';

class FlappyBirdGame extends FlameGame {
  final BirdWorld _birdWorld = BirdWorld();
  final Bird _bird = Bird();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await add(_birdWorld);
    await add(_bird);
  }
}
