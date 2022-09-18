import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flame_audio/flame_audio.dart';

final double BIRD_W = 52;
final double BIRD_H = 36.7;
final double GRAVITY = 1200;

class Bird extends SpriteAnimationComponent with HasGameRef {
  final double _animationSpeed = .15;
  late final SpriteAnimation _idleAnimation;

  double timepassed = .0;
  double speedY = .0;

  Bird() : super(size: Vector2(52, 36.7));

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await _loadAnimations().then((void value) => {animation = _idleAnimation});
  }

  Future<void> _loadAnimations() async {
    final SpriteSheet spriteSheet = SpriteSheet.fromColumnsAndRows(
        image: await gameRef.images.load('bird.png'), columns: 3, rows: 1);

    _idleAnimation = spriteSheet.createAnimation(
        row: 0, stepTime: _animationSpeed, from: 0, to: 2);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // timepassed += dt;
    speedY += GRAVITY * dt;
    anchor = Anchor.center;
    // y = (GRAVITY * timepassed * timepassed) * 0.5;
    y += (speedY * dt);
    x = gameRef.size.x * .5;
    // print(dt);
  }

  void onTap() {
    // print("user tap!!");
    // this.y = .0;
    // this.timepassed = .0;
    this.speedY = -(GRAVITY * .4);
    // Flame.audio.pay("buble_pop.mp3");
    FlameAudio.play("bubble_pop.mp3", volume: .5);
  }
}
