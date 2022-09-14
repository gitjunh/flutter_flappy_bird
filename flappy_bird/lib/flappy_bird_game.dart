import 'package:flame/game.dart';
import 'package:flappy_bird/bird_world.dart';

class FlappyBirdGame extends FlameGame {
  final BirdWorld _birdWorld = BirdWorld();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await add(_birdWorld);
  }
}
