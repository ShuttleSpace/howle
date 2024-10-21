@JS()
library;

import 'dart:js_interop';

import 'package:web/web.dart';

/// HowlCallback:
/// void Function(int soundId);
///
/// HowlErrorCallback
/// void Function(int soundId, String errorMessage);

extension type SpatialPosition._(JSArray<JSNumber> _)
    implements JSArray<JSNumber> {
  external factory SpatialPosition(
      [JSArray<JSNumber> option]); // [ JSNumberber, JSNumberber, JSNumberber ]
}

extension type SpatialOrientation._(JSArray<JSNumber> _)
    implements JSArray<JSNumber> {
  external factory SpatialOrientation(
      [JSArray<JSNumber>
          option]); // [ JSNumberber, JSNumberber, JSNumberber, JSNumberber, JSNumberber, JSNumberber ]
}

extension type SoundSpriteDefinitions._(JSObject _) implements JSObject {}

extension type PannerAttributes._(JSObject _) implements JSObject {
  external factory PannerAttributes(
      {num? coneInnerAngle,
      num? coneOuterAngle,
      num? coneOuterGain,
      String? /* inverse | linear */ distanceModel,
      num? maxDistance,
      String? /* HRTF | equalpower */ panningModel,
      num? refDistance,
      num? rolloffFactor});
  external num? get coneInnerAngle;
  external set coneInnerAngle(num? value);

  external num? get coneOuterAngle;
  external set coneOuterAngle(num? value);

  external num? get coneOuterGain;
  external set coneOuterGain(num? value);

  external String? get distanceModel;
  external set distanceModel(String? value);

  external num? get maxDistance;
  external set maxDistance(num? value);

  external String? get panningModel;
  external set panningModel(String? value);

  external num? get refDistance;
  external set refDistance(num? value);

  external num? get rolloffFactor;
  external set rolloffFactor(num? value);
}

/// setup the sound object, which each node attached to a Howl group is contained in.
extension type Sound._(JSObject _) implements JSObject {
  external factory Sound([Howl howl]);

  /// Add new properties to the core Sound init.
  /// @return {Sound}
  external Sound init();

  /// Create and setup a new sound object, whether HTML5 Audio or Web Audio.
  external Sound create();

  /// Reset the parameters of this sound to the original state (for recycle).
  /// Override the Sound.reset method to clean up properties from the spatial plugin.
  /// @return {Sound}
  external Sound reset();
}

extension type XhrOptions._(JSObject _) implements JSObject {
  external factory XhrOptions(
      {String? method, bool? withCredentials, JSObject? headers});
  external String? get method;
  external set method(String? value);

  external JSObject? get headers;
  external set headers(JSObject? value);

  external bool? get withCredentials;
  external set withCredentials(bool? value);
}

extension type HowlListeners._(JSObject _) implements JSObject {
  external factory HowlListeners({
    JSExportedDartFunction? onstop,
    JSExportedDartFunction? onpause,
    JSExportedDartFunction? onload,
    JSExportedDartFunction? onmute,
    JSExportedDartFunction? onvolume,
    JSExportedDartFunction? onrate,
    JSExportedDartFunction? onseek,
    JSExportedDartFunction? onfade,
    JSExportedDartFunction? onunlock,
    JSExportedDartFunction? onend,
    JSExportedDartFunction? onplay,
    JSExportedDartFunction? onloaderror,
    JSExportedDartFunction? onplayerror,
  });

  /// Fires when the sound has been stopped. The first parameter is the ID of the sound.
  external JSExportedDartFunction? get onstop;
  external set onstop(JSExportedDartFunction? callback);

  /// Fires when the sound has been paused. The first parameter is the ID of the sound.
  external JSExportedDartFunction? get onpause;
  external set onpause(JSExportedDartFunction? callback);

  /// Fires when the sound is loaded.
  external JSExportedDartFunction? get onload;
  external set onload(JSExportedDartFunction? callback);

  /// Fires when the sound has been muted/unmuted. The first parameter is the ID of the sound.
  external JSExportedDartFunction? get onmute;
  external set onmute(JSExportedDartFunction? callback);

  /// Fires when the sound's volume has changed. The first parameter is the ID of the sound.
  external JSExportedDartFunction? get onvolume;
  external set onvolume(JSExportedDartFunction? callback);

  /// Fires when the sound's playback rate has changed. The first parameter is the ID of the sound.
  external JSExportedDartFunction? get onrate;
  external set onrate(JSExportedDartFunction? callback);

  /// Fires when the sound has been seeked. The first parameter is the ID of the sound.
  external JSExportedDartFunction? get onseek;
  external set onseek(JSExportedDartFunction? callback);

  /// Fires when the current sound finishes fading in/out. The first parameter is the ID of the sound.
  external JSExportedDartFunction? get onfade;
  external set onfade(JSExportedDartFunction? callback);

  /// Fires when audio has been automatically unlocked through a touch/click event.
  external JSExportedDartFunction? get onunlock;
  external set onunlock(JSExportedDartFunction? callback);

  /// Fires when the sound finishes playing (if it is looping, it'll fire at the end of each loop).
  /// The first parameter is the ID of the sound.
  external JSExportedDartFunction? get onend;
  external set onend(JSExportedDartFunction? callback);

  /// Fires when the sound begins playing. The first parameter is the ID of the sound.
  external JSExportedDartFunction? get onplay;
  external set onplay(JSExportedDartFunction? callback);

  /// Fires when the sound is unable to load. The first parameter is the ID
  /// of the sound (if it exists) and the second is the error message/code.
  external JSExportedDartFunction? get onloaderror;
  external set onloaderror(JSExportedDartFunction? callback);

  /// Fires when the sound is unable to play. The first parameter is
  /// the ID of the sound and the second is the error message/code.
  external JSExportedDartFunction? get onplayerror;
  external set onplayerror(JSExportedDartFunction? callback);
}

extension type HowlOptions._(JSObject option) implements HowlListeners {
  external factory HowlOptions({
    required JSAny /* string | string[]*/ src,
    num? volume,
    bool? html5,
    bool? loop,
    JSAny preload, // boolean | 'metadata'
    bool? autoplay,
    bool? mute,
    num? pool,
    num? rate,
    JSAny? format, // string | string[]
    SoundSpriteDefinitions? sprite,
    XhrOptions? xhr,
    SpatialOrientation? orientation,
    num? stereo,
    SpatialPosition? pos,
    num? coneInnerAngle,
    num? coneOuterAngle,
    num? coneOuterGain,
    String? /* inverse | linear */ distanceModel,
    num? maxDistance,
    String? /* HRTF | equalpower */ panningModel,
    num? refDistance,
    num? rolloffFactor,
    JSExportedDartFunction? onstereo,
    JSExportedDartFunction? onpos,
    JSExportedDartFunction? onorientation,
    JSExportedDartFunction? onstop,
    JSExportedDartFunction? onpause,
    JSExportedDartFunction? onload,
    JSExportedDartFunction? onmute,
    JSExportedDartFunction? onvolume,
    JSExportedDartFunction? onrate,
    JSExportedDartFunction? onseek,
    JSExportedDartFunction? onfade,
    JSExportedDartFunction? onunlock,
    JSExportedDartFunction? onend,
    JSExportedDartFunction? onplay,
    JSExportedDartFunction? onloaderror,
    JSExportedDartFunction? onplayerror,
  });

  /// The sources to the track(s) to be loaded for the sound (URLs or base64 data URIs). These should
  /// be in order of preference, howler.js will automatically load the first one that is compatible
  /// with the current browser. If your files have no extensions, you will need to explicitly specify
  /// the extension using the format property.
  external JSAny /* string | string[]*/ get src;
  external set src(JSAny value);

  /// The volume of the specific track, from 0.0 to 1.0.
  /// @default 1.0
  external num? get volume;
  external set volume(num? value);

  /// Set to true to force HTML5 Audio. This should be used for large audio files so that you don't
  /// have to wait for the full file to be downloaded and decoded before playing.
  /// @default false
  external bool? get html5;
  external set html5(bool? value);

  /// Set to true to automatically loop the sound forever.
  /// @default false
  external bool? get loop;
  external set loop(bool? value);

  /// Automatically begin downloading the audio file when the Howl is defined. If using HTML5 Audio,
  /// you can set this to 'metadata' to only preload the file's metadata (to get its duration without
  /// download the entire file, for example).
  /// @default true
  external JSAny? /* boolean | 'metadata' */ get preload;
  external set preload(JSAny? value);

  /// Set to true to automatically start playback when sound is loaded.
  /// @default false
  external bool? get autoplay;
  external set autoplay(bool? value);

  /// Set to true to load the audio muted.
  /// @default false
  external bool? get mute;
  external set mute(bool? value);

  /// The size of the inactive sounds pool. Once sounds are stopped or finish playing, they are marked
  /// as ended and ready for cleanup. We keep a pool of these to recycle for improved performance.
  /// Generally this doesn't need to be changed. It is important to keep in mind that when a sound is
  /// paused, it won't be removed from the pool and will still be considered active so that it can be
  /// resumed later.
  /// @default 5
  external num? get pool;
  external set pool(num? value);

  /// The rate of playback. 0.5 to 4.0, with 1.0 being normal speed.
  /// @default 1.0
  external num? get rate;
  external set rate(num? value);

  /// When using Web Audio, howler.js uses an XHR request to load the audio files. If you need to send
  /// custom headers, set the HTTP method or enable withCredentials (see reference), include them with
  /// this parameter. Each is optional (method defaults to GET, headers default to null and
  /// withCredentials defaults to false).
  external XhrOptions? get xhr;
  external set xhr(XhrOptions? value);

  /// howler.js automatically detects your file format from the extension, but you may also specify a
  /// format in situations where extraction won't work (such as with a SoundCloud stream).
  external JSAny? get format; // string | string[]
  external set format(JSAny? value);

  /// Define a sound sprite for the sound. The offset and duration are defined in milliseconds. A
  /// third (optional) parameter is available to set a sprite as looping. An easy way to generate
  /// compatible sound sprites is with audiosprite.
  external SoundSpriteDefinitions? get sprite;
  external set sprite(SoundSpriteDefinitions? value);
}

extension type Howl._(JSObject _) implements JSObject, EventTarget {
  external factory Howl(HowlOptions option);

  /// Initialize a new Howl group object.
  /// @param  {Object} o Passed in properties for this group.
  /// @return {Howl}
  external Howl init(HowlOptions o);

  /// .play() is not chainable; the other methods are
  /// Play a sound or resume previous playback.
  /// @param  {String/JSNumberber} sprite   Sprite name for sprite playback or sound id to continue previous.
  /// @param  {Boolean} internal Internal Use: true prevents event firing.
  /// @return {JSNumberber}          Sound ID.
  external num? play(
      [JSAny? /*string | JSNumberber  */ spriteOrId, bool? internal]);

  /// Pause playback and save current position.
  ///  @param  {JSNumberber} id The sound ID (empty to pause all in group).
  external Howl pause([num id]);

  /// Stop playback and reset to start.
  ///  @param  {JSNumberber} id The sound ID (empty to stop all in group).
  ///  @param  {Boolean} internal Internal Use: true prevents event firing.
  external Howl stop([num id]);

  /// Mute/unmute a single sound or all sounds in this Howl group.
  /// @param  {Boolean} muted Set to true to mute and false to unmute.
  /// @param  {JSNumberber} id    The sound ID to update (omit to mute/unmute all).
  external Howl mute([bool muted, num id]);

  ///  Get/set the volume of this sound or of the Howl group. This method can optionally take 0, 1 or 2 arguments.
  ///   volume() -> Returns the group's volume value.
  ///   volume(id) -> Returns the sound id's current volume.
  ///   volume(vol) -> Sets the volume of all sounds in this Howl group.
  ///   volume(vol, id) -> Sets the volume of passed sound id.
  external num volume();
  @JS('volume')
  external Howl volume_1(
      num idOrSetVolume); // First check if this is an ID, and if not, assume it is a new volume.
  @JS('volume')
  external Howl volume_2(num volume, num id);

  /// Fade a currently playing sound between two volumes (if no id is passed, all sounds will fade).
  /// @param  {JSNumberber} from The value to fade from (0.0 to 1.0).
  /// @param  {JSNumberber} to   The volume to fade to (0.0 to 1.0).
  /// @param  {JSNumberber} len  Time in milliseconds to fade.
  /// @param  {JSNumberber} id   The sound id (omit to fade all sounds).
  ///
  external Howl fade(num from, num to, num duration, [num id]);

  /// Get/set the playback rate of a sound. This method can optionally take 0, 1 or 2 arguments.
  /// rate() -> Returns the first sound node's current playback rate.
  /// rate(id) -> Returns the sound id's current playback rate.
  /// rate(rate) -> Sets the playback rate of all sounds in this Howl group.
  /// rate(rate, id) -> Sets the playback rate of passed sound id.
  external num rate();
  external Howl rate_1(num idOrRate);
  @JS('rate')
  external Howl rate_2(num rate, num id);

  /// Get/set the seek position of a sound. This method can optionally take 0, 1 or 2 arguments.
  /// seek() -> Returns the first sound node's current seek position.
  /// seek(id) -> Returns the sound id's current seek position.
  /// seek(seek) -> Sets the seek position of the first sound node.
  /// seek(seek, id) -> Sets the seek position of passed sound id.
  external JSNumber seek();
  @JS('seek')
  external Howl seek_1(num idOrSeek);
  @JS('seek')
  external Howl seek_2(num seek, num id);

  /// Get/set the loop parameter on a sound. This method can optionally take 0, 1 or 2 arguments.
  /// loop() -> Returns the group's loop value.
  /// loop(id) -> Returns the sound id's loop value.
  /// loop(loop) -> Sets the loop value for all sounds in this Howl group.
  /// loop(loop, id) -> Sets the loop value of passed sound id.
  external bool loop();
  @JS('loop')
  external Howl loop_1(bool loop);
  @JS('loop')
  external Howl loop_2(num id);
  @JS('loop')
  external Howl loop_3(bool loop, num id);

  ///  Check if a specific sound is currently playing or not (if id is provided), or check if at least one of the sounds in the group is playing or not.
  ///  @param  {JSNumberber}  id The sound id to check. If none is passed, the whole sound group is checked.
  //    Otherwise, loop through all sounds and check if any are playing.
  external bool playing([num id]); //  Check the passed sound ID (if any).

  /// Get the duration of this sound. Passing a sound id will return the sprite duration.
  /// @param  {JSNumberber} id The sound id to check. If none is passed, return full source duration.
  /// @return {JSNumberber} Audio duration in seconds.
  external num duration([num id]);

  /// Returns the current loaded state of this Howl.
  /// @return {String} 'unloaded', 'loading', 'loaded'
  external String /* unloading | loading | loaded */ state();

  /// Load the audio file.
  external Howl load();

  /// Unload and destroy the current Howl object.
  /// This will immediately stop all sound instances attached to this group.
  external void /* null */ unload();

  /// Get/set the stereo panning of the audio source for this sound or all in the group.
  /// @param  {Number} pan  A value of -1.0 is all the way left and 1.0 is all the way right.
  ///  @param  {Number} id (optional) The sound ID. If none is passed, all in group will be updated.
  /// @return {Howl/Number}    Returns self or the current stereo panning value.
  external num stereo();
  @JS('stereo')
  external Howl stereo_1(num pan, [num id]);

  /// Get/set the 3D spatial position of the audio source for this sound or group relative to the global listener.
  /// @param  {Number} x  The x-position of the audio source.
  /// @param  {Number} y  The y-position of the audio source.
  /// @param  {Number} z  The z-position of the audio source.
  /// @param  {Number} id (optional) The sound ID. If none is passed, all in group will be updated.
  /// @return {Howl/Array}    Returns self or the current 3D spatial position: [x, y, z].
  external SpatialPosition pos();
  @JS('pos')
  external Howl pos_1(num x, num y, num z, [num id]);

  ///  Get/set the direction the listener is pointing in the 3D cartesian space.
  ///  A front and up vector must be provided. The front is the direction the
  /// face of the listener is pointing, and up is the direction the top of the
  /// listener is pointing. Thus, these values are expected to be at right angles
  /// from each other.
  /// @param  {Number} x   The x-orientation of the listener.
  /// @param  {Number} y   The y-orientation of the listener.
  /// @param  {Number} z   The z-orientation of the listener.
  /// @param  {Number} xUp The x-orientation of the top of the listener.
  /// @param  {Number} yUp The y-orientation of the top of the listener.
  /// @param  {Number} zUp The z-orientation of the top of the listener.
  /// @return {Howler/Array}     Returns self or the current orientation vectors.
  external SpatialOrientation orientation();
  @JS('orientation')
  external Howl orientation_1(num x, num y, num z, [num id]);

  /// Get/set the panner node's attributes for a sound or group of sounds.
  /// This method can optionall take 0, 1 or 2 arguments.
  /// pannerAttr() -> Returns the group's values.
  /// pannerAttr(id) -> Returns the sound id's values.
  /// pannerAttr(o) -> Set's the values of all sounds in this Howl group.
  /// pannerAttr(o, id) -> Set's the values of passed sound id.
  ///
  /// Attributes:
  ///   coneInnerAngle - (360 by default) A parameter for directional audio sources, this is an angle, in degrees,inside of which there will be no volume reduction.
  ///   coneOuterAngle - (360 by default) A parameter for directional audio sources, this is an angle, in degrees,outside of which the volume will be reduced to a constant value of `coneOuterGain`.
  ///   coneOuterGain - (0 by default) A parameter for directional audio sources, this is the gain outside of the `coneOuterAngle`. It is a linear value in the range `[0, 1]`.
  ///   distanceModel - ('inverse' by default) Determines algorithm used to reduce volume as audio moves away from listener. Can be `linear`, `inverse` or `exponential.
  ///   maxDistance - (10000 by default) The maximum distance between source and listener, after which the volume will not be reduced any further.
  ///   refDistance - (1 by default) A reference distance for reducing volume as source moves further from the listener. This is simply a variable of the distance model and has a different effect depending on which model is used and the scale of your coordinates. Generally, volume will be equal to 1 at this distance.
  ///   rolloffFactor - (1 by default) How quickly the volume reduces as source moves from listener. This is simply a variable of the distance model and can be in the range of `[0, 1]` with `linear` and `[0, ∞]` with `inverse` and `exponential`.
  ///   panningModel - ('HRTF' by default) Determines which spatialization algorithm is used to position audio. Can be `HRTF` or `equalpower`.
  /// @return {Howl/Object} Returns self or current panner attributes.
  external PannerAttributes pannerAttr([num id]);
  @JS('pannerAttr')
  external Howl pannerAttr_1(PannerAttributes attr, [num id]);

  /// @param  {String}   event Event name. play | end | pause | stop | mute | volume | rate | seek | fade | unlock | loaderror | playerror | load
  /// @param  {Function} fn    Listener to call. () => void
  /// @param  {JSNumberber}   id    (optional) Only listen to events for this sound.
  /// @param  {JSNumberber}   once  (INTERNAL) Marks event to fire only once.
  ///
  external Howl on(JSString event, JSExportedDartFunction callback,
      [num id, num once]);

  /// @param  {String}   event Event name. play | end | pause | stop | mute | volume | rate | seek | fade | unlock | loaderror | playerror | load
  /// @param  {Function} fn    Listener to call. () => void
  /// @param  {JSNumberber}   id    (optional) Only listen to events for this sound.
  ///
  external Howl once(JSString event, JSExportedDartFunction callback, [num id]);

  /// @param  {String}   event Event name. play | end | pause | stop | mute | volume | rate | seek | fade | unlock | loaderror | playerror | load
  /// @param  {Function} fn    Listener to call. () => void
  /// @param  {JSNumberber}   id    (optional) Only listen to events for this sound.
  ///
  external Howl off(JSString event, JSExportedDartFunction callback, [num id]);
  @JS('off')
  external Howl off_1(JSString event, num id);
}

extension type HowlerGlobal._(JSObject _) implements JSObject {
  external factory HowlerGlobal();
  external HowlerGlobal init();

  /// Handle muting and unmuting globally.
  /// @param  {Boolean} muted Is muted or not.
  external HowlerGlobal mute(bool muted);

  ///  Handle stopping all sounds globally.
  external HowlerGlobal stop();

  /// Get/set the global volume for all sounds.
  /// @param  {Float} vol Volume from 0.0 to 1.0.
  /// @return {Howler/Float}     Returns self or current volume.
  external num volume();
  @JS('volume')
  external HowlerGlobal volume_1(num volume);

  /// Check for codec support of specific extension.
  /// @param  {String} ext Audio file extention.
  /// @return {Boolean}
  external bool codecs(String ext);

  /// Unload and destroy all currently loaded Howl objects.
  external HowlerGlobal unload();

  external bool get usingWebAudio;
  external set usingWebAudio(bool value);

  external num get htm5PoolSize;
  external set html5PoolSize(num value);

  external bool get noAudio;
  external set noAudio(bool value);

  external bool get autoUnlock;
  external set autoUnlock(bool value);

  external bool get autoSuspend;
  external set autoSuspend(bool value);

  external AudioContext get ctx;
  external set ctx(AudioContext value);

  external GainNode get masterGain;
  external set masterGain(GainNode value);

  /// Helper method to update the stereo panning position of all current Howls.
  /// Future Howls will not use this value unless explicitly set.
  ///  @param  {Number} pan A value of -1.0 is all the way left and 1.0 is all the way right.
  ///  @return {Howler/Number}     Self or current stereo panning value.
  external HowlerGlobal stereo(num pan);

  /// Get/set the position of the listener in 3D cartesian space. Sounds using
  /// 3D position will be relative to the listener's position.
  /// @param  {Number} x The x-position of the listener.
  /// @param  {Number} y The y-position of the listener.
  /// @param  {Number} z The z-position of the listener.
  /// @return {Howler/Array}   Self or current listener position.
  external SpatialPosition pos();
  @JS('pos')
  external HowlerGlobal /* Howler | SpatialPosition */ pos_1(
      [num x, num y, num z]);

  ///  Get/set the direction the listener is pointing in the 3D cartesian space.
  ///  A front and up vector must be provided. The front is the direction the
  /// face of the listener is pointing, and up is the direction the top of the
  /// listener is pointing. Thus, these values are expected to be at right angles
  /// from each other.
  /// @param  {Number} x   The x-orientation of the listener.
  /// @param  {Number} y   The y-orientation of the listener.
  /// @param  {Number} z   The z-orientation of the listener.
  /// @param  {Number} xUp The x-orientation of the top of the listener.
  /// @param  {Number} yUp The y-orientation of the top of the listener.
  /// @param  {Number} zUp The z-orientation of the top of the listener.
  /// @return {Howler/Array}     Returns self or the current orientation vectors.
  external SpatialOrientation orientation();
  external HowlerGlobal orientation_1(
      [num x, num y, num z, num xUp, num yUp, num zUp]);
}

/// global variable
@JS()
// ignore: non_constant_identifier_names
external HowlerGlobal Howler;

///  Buffer a sound from URL, Data URI or cache and decode to audio source (Web Audio API).
@JS()
external void loadBuffer(Howl self);

@JS()
external void safeXhrSend(JSObject xhr);

/// Decode audio data from an array buffer.
@JS()
external void decodeAudioData(JSArrayBuffer arraybuffer, Howl self);

///  Sound is now loaded, so finish setting everything up and fire the loaded event.
@JS()
external void loadSound(Howl self, JSObject buffer);

@JS()
external void setupAudioContext();

/// Create a new panner node and save it on the sound.
/// @param  {Sound} sound Specific sound to setup panning on.
/// @param {String} type Type of panner to create: 'stereo' or 'spatial'.
@JS()
external void setupPanner(Sound sound, String type);
