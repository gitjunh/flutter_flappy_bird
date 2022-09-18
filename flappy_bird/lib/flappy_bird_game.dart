import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flappy_bird/bird.dart';
import 'package:flappy_bird/bird_world.dart';
import 'package:flappy_bird/floor.dart';

class FlappyBirdGame extends FlameGame with TapDetector {
  final BirdWorld _birdWorld = BirdWorld();
  final Floor _floor = Floor();
  final Bird _bird = Bird();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await add(_birdWorld);
    await add(_floor);
    await add(_bird);
  }

  @override
  void onTap() {
    super.onTap();
    _bird.onTap();
  }
}
