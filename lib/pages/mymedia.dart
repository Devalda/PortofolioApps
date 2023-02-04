import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyMedia extends StatefulWidget {
  @override
  State<MyMedia> createState() => _MyMediaState();
}

class _MyMediaState extends State<MyMedia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("connect me ")),
    );
  }
}
