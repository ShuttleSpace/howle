## description

Howler.js is an Audio library for the modern web.
howler.js makes working with audio in JavaScript easy and reliable across all platforms.

Support the following features.
- Simplified API. A single, consistent API for all of your audio needs makes building your audio experiences fun and easy.
- Audio Sprites. Easily define and control segments of files with audio sprites for more precise playback and lower resources.
- Spatial Audio. Whether a simple stereo pan or advanced 3D game audio, howler.js makes it easy to keep it all straight.
- Full Codec Support. Supports all browser-ready files: MP3, MPEG, OPUS, OGG, OGA, WAV, AAC, CAF, M4A, MP4, WEBA, WEBM, DOLBY, FLAC.
- Works Everywhere. Defaults to Web Audio and falls back to HTML5 Audio to provide full coverage across all browsers and platforms including IE9 and Cordova.
- Full Control. Control everything from play, pause and seek to rate, fade and loop, just to name a few.
- Auto Caching. Loaded sounds are automatically cached and re-used on subsequent calls for better performance and bandwidth.
- Modular. Use only what you need with the new modular architecture. Easily extend the library to add custom features.
- Zero Dependencies. howler.js is as light as 7KB gzipped and is 100% JavaScript with no outside dependencies or plugins.

Howle is a library based on howler.js v2.2.4 that uses dart:js_interop bindings. For more details, please visit [howlerjs.com](https://howlerjs.com/)

### usage

1、add howler.js to index.html

```html
  <!-- <script src="https://cdn.jsdelivr.net/npm/howler@2.2.4/dist/howler.min.js"></script> -->
  <script src="assets/js/howler.min.js"></script>
  <script src="assets/js/howler.spatial.min.js"></script>
```

2、import howle and use it

```dart
import 'package:howle/howle.dart';
Howl howl = Howl(HowlOptions(src: 'https://BlackSwan.mp3'.toJS));
howl.play();
howl.stop();
```

### api

| Class or Global Variable/Function  | instance field  | description |
|---|---|---|
| Howl  | init  | Initialize a new Howl group object.  |
|   | play()  |  Play a sound or resume previous playback. |
|   | pause() | Pause playback and save current position.  |
|   | stop() | Stop playback and reset to start.  |
|   | mute() | Mute/unmute a single sound or all sounds in this Howl group.  |
|   | volume() | Get/set the volume of this sound or of the Howl group. This method can optionally take 0, 1 or 2 arguments.(Use the volume_1/volume_2 method to replace the JavaScript approach of omitting function parameters in calls.)  |
|   | fade() | Fade a currently playing sound between two volumes (if no id is passed, all sounds will fade).  |
|   | rate() | Get/set the playback rate of a sound. This method can optionally take 0, 1 or 2 arguments.(Use the rate_1/rate_2 method to replace the JavaScript approach of omitting function parameters in calls.)  |
|   | seek() | Get/set the seek position of a sound. This method can optionally take 0, 1 or 2 arguments.(Use the seek_1/seek_2 method to replace the JavaScript approach of omitting function parameters in calls.)  |
|   | loop() | Get/set the loop parameter on a sound. This method can optionally take 0, 1 or 2 arguments.(Use the loop_1/loop_2/loop_3 method to replace the JavaScript approach of omitting function parameters in calls.)  |
|   | playing() | Check if a specific sound is currently playing or not (if id is provided), or check if at least one of the sounds in the group is playing or not.  |
|   | duration() | Get the duration of this sound. Passing a sound id will return the sprite duration.  |
|   | state() | Returns the current loaded state of this Howl.  |
|   | load() | Load the audio file.  |
|   | unload() | Unload and destroy the current Howl object.  |
|   | stereo() | Get/set the stereo panning of the audio source for this sound or all in the group.(Use the stereo_1 method to replace the JavaScript approach of omitting function parameters in calls.)  |
|   | pos() | Get/set the 3D spatial position of the audio source for this sound or group relative to the global listener.(Use the pos_1 method to replace the JavaScript approach of omitting function parameters in calls.)  |
|   | orientation() | Get/set the direction the listener is pointing in the 3D cartesian space. A front and up vector must be provided. The front is the direction the face of the listener is pointing, and up is the direction the top of the listener is pointing. Thus, these values are expected to be at right angles from each other.(Use the orientation_1 method to replace the JavaScript approach of omitting function parameters in calls.)  |
|   | pannerAttr() | Get/set the panner node's attributes for a sound or group of sounds.(Use the pannerAttr_1 method to replace the JavaScript approach of omitting function parameters in calls.)  |
|   | on() | add event listener. play、end、pause、stop、mute、volume、rate、seek、fade、unlock、loaderror、playerror、load  |
|   | once() | add event listener, trigger only once. play、end、pause、stop、mute、volume、rate、seek、fade、unlock、loaderror、playerror、load  |
|   | off() | remove event listener.(Use the off_1 method to replace the JavaScript approach of omitting function parameters in calls.)  |
| HowlerGlobal  | init() | Provide a global variable Holwer to operate globally. |
|   | mute() | Handle muting and unmuting globally.  |
|   | stop() | Handle stopping all sounds globally.  |
|   | volume() | Get/set the global volume for all sounds.(Use the volume_1 method to replace the JavaScript approach of omitting function parameters in calls.)  |
|   | codecs() | Check for codec support of specific extension.  |
|   | unload() | Unload and destroy all currently loaded Howl objects.  |
|   | usingWebAudio | use WebAudio  |
|   | htm5PoolSize | Pool of unlocked HTML5 Audio objects.  |
|   | noAudio | support [Audio](https://developer.mozilla.org/zh-CN/docs/Web/API/HTMLAudioElement/Audio) or not |
|   | autoUnlock | Set to false to disable the auto audio unlocker.  |
|   | autoSuspend | Automatically suspend the Web Audio AudioContext after no sound has played for 30 seconds.  |
|   | ctx | Get/set AudioContext  |
|   | masterGain | Get/set GainNode  |
|   | stereo() | Helper method to update the stereo panning position of all current Howls. Future Howls will not use this value unless explicitly set. |
|   | pos() | Get/set the position of the listener in 3D cartesian space. Sounds using 3D position will be relative to the listener's position.(Use the pos_1 method to replace the JavaScript approach of omitting function parameters in calls.) |
|   | orientation() | Get/set the direction the listener is pointing in the 3D cartesian space. A front and up vector must be provided. The front is the direction the face of the listener is pointing, and up is the direction the top of the listener is pointing. Thus, these values are expected to be at right angles from each other.(Use the orientation_1 method to replace the JavaScript approach of omitting function parameters in calls.) |
| Howler |   |  global variable, instance of HowlerGlobal |
| loadBuffer() |   |  global function, Buffer a sound from URL, Data URI or cache and decode to audio source (Web Audio API), use internal |
| safeXhrSend() |   |  global function, use internal. |
| decodeAudioData() |   |  global function, Decode audio data from an array buffer.use internal. |
| loadSound() |   |  global function, Sound is now loaded, so finish setting everything up and fire the loaded event.use internal. |
| setupAudioContext() |   |  global function, use internal. |
| setupPanner() |   |  global function, Create a new panner node and save it on the sound. use internal. |

### contributes

If you notice any changes in the JS API or encounter other issues, please open an issue on [GitHub](https://github.com/ShuttleSpace/howle).