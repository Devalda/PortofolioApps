import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class MyProject extends StatefulWidget {
  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  var MQwidth, MQsize, MQheight;
  bool isRotate = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 5000), () {
      setState(() {
        isRotate = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MQsize = MediaQuery.of(context).size;
    MQwidth = MQsize.width;
    MQheight = MQsize.height;
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        setState(() {
          isRotate = !isRotate;
        });
      },
      child: Stack(children: [
        AnimatedRotation(
          turns: isRotate ? 1 : 0,
          duration: const Duration(milliseconds: 800),
          child: SizedBox(
              height: MQheight,
              width: MQwidth,
              child: const RiveAnimation.asset(
                fit: BoxFit.cover,
                "assets/RiveAssets/Orbit.riv",
                artboard: "Space Scene Demo",
                // onInit:
              )),
        ),
        Container()
      ]),
    ));
  }
}
