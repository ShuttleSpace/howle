import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:web/web.dart' show document;

class ThreeDPage extends StatefulWidget {
  const ThreeDPage({super.key});

  @override
  State<ThreeDPage> createState() => _ThreeDPageState();
}

class _ThreeDPageState extends State<ThreeDPage> {
  @override
  void initState() {
    super.initState();
    var span = document.createElement('span')..innerHTML = '手动创建'.toJS;
    document.body?.appendChild(span);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('3D'),
      ),
      body: const Center(
        child: Text('3D'),
      ),
    );
  }
}
