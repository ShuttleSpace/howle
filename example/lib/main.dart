import 'package:example/player.dart';
import 'package:example/radio.dart';
import 'package:example/sprite.dart';
import 'package:example/three_d.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Howler.js❤️Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        '/player': (context) => const PlayerPage(),
        '/radio': (context) => const RadioPage(),
        '/3d': (context) => const ThreeDPage(),
        '/sprite': (context) => const SpritePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FilledButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/player');
                },
                child: const Text('Player')),
            const SizedBox(
              height: 12,
            ),
            FilledButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/3d');
                },
                child: const Text('3d')),
            const SizedBox(
              height: 12,
            ),
            FilledButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/sprite');
                },
                child: const Text('Sprite')),
            const SizedBox(
              height: 12,
            ),
            FilledButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/radio');
                },
                child: const Text('Radio'))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
