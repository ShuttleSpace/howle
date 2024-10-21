## howler.js dart:js_interop binding

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
Howl howl = Howl(HowlOptions(src: 'https://hangf-1253488539.cos.ap-nanjing.myqcloud.com/sound/01.%20Black%20Swan.mp3'.toJS));
howl.play();
howl.stop();
```

### attention

only support web platform!!!