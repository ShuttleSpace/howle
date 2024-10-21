import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:web/web.dart' show console;
import 'package:howle/howle.dart';
import 'dart:math' as Math;

class SpritePage extends StatefulWidget {
  const SpritePage({super.key});

  @override
  State<SpritePage> createState() => _SpritePageState();
}

class _SpritePageState extends State<SpritePage> {
  late Sprite sprite;
  String title = '';
  @override
  void initState() {
    super.initState();
    sprite = Sprite(
        spriteMap: {
          'sprite0': 'one',
          'sprite1': 'two',
          'sprite2': 'three',
          'sprite3': 'four',
          'sprite4': 'five',
          'sprite5': 'beat',
        },
        sprite: {
          'one': [0, 450],
          'two': [2000, 250],
          'three': [4000, 350],
          'four': [6000, 380],
          'five': [8000, 340],
          'beat': [10000, 11163]
        }.jsify()! as JSObject,
        src: [
          'sound2.webm',
          'sound2.mp3',
          'sound2.wav',
          'sound1.mp3',
          'sound1.wav',
          'sound1.webm',
          'sound3.webm',
          'sound3.mp3',
          'sound3.wav',
        ].map((e) => 'assets/sprite/audio/$e').toList().jsify()!,
        onswitch: (k) {
          setState(() {
            title = k;
          });
        });
  }

  @override
  void dispose() {
    super.dispose();
    sprite.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Sprite 🛹'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 48),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
              Color.fromRGBO(11, 98, 179, 1),
              Color.fromRGBO(124, 255, 95, 1)
            ],
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
                tileMode: TileMode.clamp)),
        child: Center(
            child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 48),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...sprite.spriteMap.values.map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FilledButton(
                          onPressed: () {
                            sprite.play(e);
                          },
                          child: Text(e)),
                    ))
              ],
            )
          ],
        )),
      ),
    );
  }
}

class Sprite {
  final List<int> sounds = [];
  final Map<String, String> spriteMap;
  final JSObject sprite;
  ValueChanged? onswitch;
  late Howl howl;
  Sprite(
      {required this.spriteMap,
      required this.sprite,
      required JSAny src,
      this.onswitch}) {
    howl = Howl(HowlOptions(src: src, sprite: sprite));
  }

  play(String sprite) {
    howl.stop();
    console.log('[play] ${howl.state()}'.toJS);
    var id = howl.play(sprite.jsify());
    console.log('[play] $id'.toJS);
  }

  random() {
    howl.stop();
    var key = spriteMap.keys.elementAt(Math.Random().nextInt(6));
    play(spriteMap[key]!);
    onswitch?.call(spriteMap[key]);
  }

  stop() {
    howl.stop();
  }
}
