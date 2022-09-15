import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

class Bird extends SpriteAnimationComponent with HasGameRef {
  final double _animationSpeed = .15;
  late final SpriteAnimation _idleAnimation;
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
    anchor = Anchor.center;
    y = gameRef.size.y * .5;
    x = gameRef.size.x * .5;
  }
}
