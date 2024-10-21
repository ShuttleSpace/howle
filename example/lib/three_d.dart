import 'package:flutter/material.dart';

class ThreeDPage extends StatefulWidget {
  const ThreeDPage({super.key});

  @override
  State<ThreeDPage> createState() => _ThreeDPageState();
}

class _ThreeDPageState extends State<ThreeDPage> {
  @override
  void initState() {
    super.initState();
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
