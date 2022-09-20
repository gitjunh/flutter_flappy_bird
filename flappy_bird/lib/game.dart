import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/parallax.dart';
import 'package:flame/sprite.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum GameState { Playing, Stagging, DeadMenu }

class FlappyGame extends FlameGame with TapDetector {
  static const BOX_KEY = 'flappy_flame';
  static const BEST_SCORE_KEY = 'best_score';
  GameState gameState = GameState.Stagging;
  late int _score;
  late Box _hiveBox;
  late bool _isTaped;
  late bool _isStaggingReady;

  @override
  Future<void> onLoad() async {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _isTaped = false;
    _isStaggingReady = true;

    await Hive.initFlutter();
    _hiveBox = await Hive.openBox(BOX_KEY);

    final topPipePosition = Vector2(size.x, 0);
    final bottomPipePosition = Vector2(size.x, (size.y - (size.y / 6)));
    final blanchonPosition = Vector2((size.x / 2), (size.y / 2));

    // Loading audio files
    await FlameAudio.audioCache.loadAll(['hit.mp3', 'flap.mp3']);

    // Loading all game images
    final birdImage1 = await Sprite.load('bird_1.png');
    final birdImage2 = await Sprite.load('bird_2.png');
    final birdImage3 = await Sprite.load('bird_3.png');
    final birdImages = [birdImage1, birdImage2, birdImage3];
    final birdAnimation = SpriteAnimation.spriteList(birdImages, stepTime: 0.2);
    final bgParallaxImage = await loadParallaxImage('bg.png',
        alignment: Alignment.bottomCenter, fill: LayerFill.height);
    final groundImage = await images.load('ground.png');
    final topPipeImage = await images.load('top-pipe.png');
    final bottomPipeImage = await images.load('bottom-pipe.png');
    final gameOverImage = await images.load('game_over.png');
    final scoreBoardImage = await images.load('score_board.png');
    final image0 = await images.load('0.png');
    final image1 = await images.load('1.png');
    final image2 = await images.load('2.png');
    final image3 = await images.load('3.png');
    final image4 = await images.load('4.png');
    final image5 = await images.load('5.png');
    final image6 = await images.load('6.png');
    final image7 = await images.load('7.png');
    final image8 = await images.load('8.png');
    final image9 = await images.load('9.png');
    final scoreElementImages = [
      image0,
      image1,
      image2,
      image3,
      image4,
      image5,
      image6,
      image7,
      image8,
      image9,
    ];

    final blanchonSize = Vector2(64, 64);

    // Init core

    // Init components

    // Init displayed score
    getDisplyedScore();
    _score = 0;
  }

  @override
  void onTapDown(TapDownInfo info) {
    switch (gameState) {
      case GameState.Playing:
        FlameAudio.play('flap.mp3');
        _isTaped = true;
        break;
      case GameState.Stagging:
        FlameAudio.play('flap.mp3');
        _startGame();
        break;
      case GameState.DeadMenu:
        if (_isStaggingReady) {
          _startStagging();
        }
        break;
      default:
        break;
    }
  }

  @override
  void update(double dt) {
    if (gameState == GameState.Playing) {
      if (_isTaped) {
        _isTaped = false;
      }
    }
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  void _startGame() {
    gameState = GameState.Playing;
  }

  void _startStagging() {
    gameState = GameState.Stagging;
  }

  void getDisplyedScore() {}
}
