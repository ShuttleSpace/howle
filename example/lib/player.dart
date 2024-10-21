// ignore_for_file: avoid_print

import 'dart:async';
import 'package:web/web.dart' show console;
import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:howle/howle.dart';
import 'package:siri_wave/siri_wave.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  double volume = 1.0;
  bool isPlaying = false;
  final waveController = IOS9SiriWaveformController(
      amplitude: 1, speed: 0.05, startImmedidately: false);
  late Player player;
  String progress = '0:0';
  String duration = '0:0';

  @override
  void initState() {
    super.initState();
    player = Player(
        playlist: [
          SongDetail(title: 'Rave Digger', file: 'rave_digger', howl: null),
          SongDetail(title: '80s Vibe', file: '80s_vibe', howl: null),
          SongDetail(title: 'Running Out', file: 'running_out', howl: null),
        ],
        onplay: () {
          setState(() {
            isPlaying = true;
          });
          waveController.start();
        },
        onpause: () {
          setState(() {
            isPlaying = false;
          });
          waveController.stop();
        },
        onstop: () {
          setState(() {
            isPlaying = false;
          });
          waveController.stop();
        },
        onseek: () {
          console.log('seek'.toJS);
        },
        onprogress: (progres) {
          console.log('progress $progres'.toJS);
        });
  }

  @override
  void dispose() {
    super.dispose();
    player.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Player'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 48),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
              Color.fromARGB(255, 187, 113, 243),
              Color.fromRGBO(61, 76, 145, 1)
            ],
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
                tileMode: TileMode.clamp)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(player.playlist[player.index].progress),
                Text(
                  player.trackTitle,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(player.playlist[player.index].duration)
              ],
            ),
            SiriWaveform.ios9(
              controller: waveController,
              options: IOS9SiriWaveformOptions(
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          showDragHandle: true,
                          useRootNavigator: true,
                          context: context,
                          builder: (context) {
                            return Dialog(
                              insetPadding: EdgeInsets.zero,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      player.skipTo(index);
                                      Navigator.pop(context);
                                    },
                                    child: ListTile(
                                      title: Text(player.playlist[index].title),
                                    ),
                                  );
                                },
                                itemCount: player.playlist.length,
                              ),
                            );
                          });
                    },
                    icon: const Icon(Icons.list)),
                IconButton(
                    onPressed: () {
                      player.skip(SkipDirection.prev);
                    },
                    icon: const Icon(Icons.arrow_back)),
                IconButton(
                    onPressed: () {
                      if (isPlaying) {
                        player.pause();
                      } else {
                        player.play();
                      }
                    },
                    icon: Icon(
                        isPlaying ? Icons.pause_circle : Icons.play_circle)),
                IconButton(
                    onPressed: () {
                      player.skip(SkipDirection.next);
                    },
                    icon: const Icon(Icons.arrow_forward)),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          showDragHandle: true,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (BuildContext context,
                                  void Function(void Function()) setState) {
                                return Column(
                                  children: [
                                    Text(
                                        'Change Volume: ${volume.toStringAsFixed(2)}'),
                                    Flexible(
                                      child: Slider.adaptive(
                                          value: volume,
                                          onChanged: (v) {
                                            setState(() {
                                              volume = v;
                                            });
                                            player.volume(v);
                                          }),
                                    ),
                                  ],
                                );
                              },
                            );
                          });
                    },
                    icon: const Icon(Icons.soup_kitchen)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SongDetail {
  final String title;
  final String file;
  Howl? howl;
  String duration = '';
  String progress = '';
  bool playing = false;
  int soundId = 0;

  SongDetail({required this.title, required this.file, this.howl});
  @override
  String toString() =>
      '{ title: $title, file: $file, duration: $duration, progress: $progress, playing: $playing, soundId: $soundId }';
}

enum SkipDirection { next, prev }

class Player {
  final List<SongDetail> playlist;
  int index = 0;
  VoidCallback? onplay;
  VoidCallback? onpause;
  VoidCallback? onstop;
  VoidCallback? onseek;
  ValueChanged? onprogress;

  Player(
      {required this.playlist,
      this.onplay,
      this.onpause,
      this.onstop,
      this.onseek,
      this.onprogress});

  String get trackTitle => '${index + 1}. ${playlist[index].title}';
  bool get playing => playlist.any((e) => e.howl?.playing() ?? e.playing);
  int get currentSoundId => playlist[index].soundId;

  play({int? index}) {
    var data = playlist[index ?? this.index];
    if (data.playing) {
      console.log('already playing: ${data.toString()}'.toJS);
      return;
    }
    Howl sound;
    if (data.howl != null) {
      sound = data.howl!;
    } else {
      sound = Howl(HowlOptions(
          src: [
            'assets/player/audio/${data.file}.webm',
            'assets/player/audio/${data.file}.mp3'
          ].toList().jsify()!,
          html5: true,
          loop: true));
      sound
          .on(
            'play'.toJS,
            (() {
              data
                ..duration = formatTime(sound.duration().toInt())
                ..playing = true;
              console.log(
                  'sound[onplay]: ${data.soundId} play, duration: ${formatTime(sound.duration().toInt())}'
                      .toJS);
              onplay?.call();
            }).toJS,
          )
          .on(
            'seek'.toJS,
            (() {
              step();
              onseek?.call();
            }).toJS,
          )
          .on(
              'pause'.toJS,
              (() {
                data.playing = false;
                console.log('sound[onpause]: ${data.soundId} pause'.toJS);
                onpause?.call();
              }).toJS)
          .on(
              'stop'.toJS,
              (() {
                data.playing = false;
                console.log('sound[onstop]: ${data.soundId} stop'.toJS);
                onstop?.call();
              }).toJS);
      data.howl = sound;
    }

    data.soundId = sound.play()?.toInt() ?? 0;
    console.log('[play] ${data.toString()}'.toJS);
    this.index = index ?? this.index;
  }

  pause() {
    for (var e in playlist) {
      if (e.playing) {
        e.howl?.pause(e.soundId);
        console.log(
            'sound[pause]: ${e.soundId} ${e.title} isPlaying: ${e.howl?.playing(e.soundId)}'
                .toJS);
      }
    }
  }

  stop() {
    for (var e in playlist) {
      if (e.playing) {
        e.howl?.stop(e.soundId);
        console.log(
            'sound[stop]: ${e.soundId} ${e.title} isPlaying: ${e.howl?.playing(e.soundId)}'
                .toJS);
      }
    }
  }

  skip(SkipDirection sd) {
    var idx = 0;
    if (sd == SkipDirection.prev) {
      idx = index - 1;
      if (idx < 0) {
        idx = playlist.length - 1;
      }
    } else {
      idx = index + 1;
      if (idx >= playlist.length) {
        idx = 0;
      }
    }
    skipTo(idx);
  }

  skipTo(int idx) {
    for (var e in playlist) {
      if (e.playing) {
        e.howl?.stop(e.soundId);
      }
    }
    play(index: idx);
  }

  volume(double v) {
    Howler.volume_1(v);
  }

  seek(double percent) {
    var sound = playlist[index].howl;
    if (sound != null) {
      if (sound.playing() == true) {
        sound.seek_2((sound.duration().toInt() * percent), currentSoundId);
      }
    }
  }

  step() {
    var sound = playlist[index].howl;
    if (sound != null) {
      var seek = sound.seek().toDartDouble.toInt();
      playlist[index].progress = formatTime(seek.round());
      var progres = (seek / sound.duration().toInt()) * 100;
      onprogress?.call(progres);
      if (sound.playing() == true) {
        scheduleMicrotask(step);
      }
    }
  }

  String formatTime(int seconds) {
    var min = (seconds / 60).floor();
    var sec = (seconds - min * 60);
    return '$min:${sec < 10 ? 0 : ""}$sec';
  }
}
