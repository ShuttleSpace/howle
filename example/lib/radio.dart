import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:howle/howle.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  late Radio radio;
  @override
  void initState() {
    super.initState();
    radio = Radio(playlist: [
      RadioDetail(
          title: 'BlackSwan',
          freq: '322',
          src:
              'https://hangf-1253488539.cos.ap-nanjing.myqcloud.com/sound/01.%20Black%20Swan.mp3'),
      RadioDetail(
          title: 'I\'m Fine',
          freq: '322',
          src:
              'https://hangf-1253488539.cos.ap-nanjing.myqcloud.com/sound/14.%20I%60m%20Fine.mp3'),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Radio📻'),
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
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              selected: radio.playlist[index].isLiving,
              selectedColor: Colors.amberAccent,
              onTap: () {
                if (radio.playlist[index].isLiving) {
                  radio.stop();
                } else {
                  radio.play(index: index);
                }
                setState(() {});
              },
              title: Text(
                radio.playlist[index].title,
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
              trailing:
                  radio.playlist[index].isLiving ? const Icon(Icons.abc) : null,
            );
          },
          itemCount: radio.playlist.length,
        ),
      ),
    );
  }
}

class RadioDetail {
  final String title;
  final String freq;
  final String src;
  int soundId = 0;
  Howl? howl;
  bool isLiving = false;

  RadioDetail(
      {required this.title, required this.freq, required this.src, this.howl});
  @override
  String toString() => '{ title: $title, freq: $freq, src: $src }';
}

class Radio {
  List<RadioDetail> playlist;
  int index = 0;

  Radio({required this.playlist});

  play({int? index}) {
    index ??= this.index;
    var data = playlist[index];
    if (data.isLiving) return;
    Howl sound;
    if (data.howl != null) {
      sound = data.howl!;
    } else {
      sound = Howl(HowlOptions(
          src: data.src.toJS, html5: true, format: ['mp3', 'aac'].jsify()));
      data.howl = sound;
    }
    playlist = playlist.indexed.map<RadioDetail>((e) {
      if (e.$1 == index) {
        e.$2.isLiving = true;
        e.$2.soundId = sound.play()?.toInt() ?? 0;
      } else {
        e.$2.isLiving = false;
        stop(idx: e.$1);
      }
      return e.$2;
    }).toList();
    this.index = index;
  }

  stop({int? idx}) {
    idx ??= index;
    var data = playlist[idx];
    if (!data.isLiving) return;
    playlist[idx].isLiving = false;
    data.howl?.pause(data.soundId);
  }
}
