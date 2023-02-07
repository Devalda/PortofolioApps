import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

const colorizeColors = [
  Color(0xFF2d1b46),
  Color(0xFF790f6a),
  Color(0xFFb93692),
  Color(0xFFe851c4),
  Color(0xFFb93692),
  Color(0xFF790f6a),
  Color(0xFF2d1b46),
  Color(0xFF790f6a),
];

class MyMedia extends StatefulWidget {
  @override
  State<MyMedia> createState() => _MyMediaState();
}

class _MyMediaState extends State<MyMedia> {
  bool riseUp = true;
  List effectbost = [
    [
      BoxShadow(
        color: const Color.fromARGB(255, 174, 166, 166)!,
        offset: const Offset(4, 4),
        blurRadius: 15,
        spreadRadius: 1,
      ),
      const BoxShadow(
        color: Color.fromARGB(255, 239, 238, 238),
        offset: Offset(-4, -4),
        blurRadius: 15,
        spreadRadius: 1,
      ),
    ],
    [
      const BoxShadow(
        color: Color.fromARGB(255, 253, 227, 255),
        offset: Offset(4, 4),
        blurRadius: 0,
        spreadRadius: 1,
      ),
      const BoxShadow(
        color: Color.fromARGB(255, 253, 227, 255),
        offset: Offset(-4, -4),
        blurRadius: 0,
        spreadRadius: 1,
      ),
    ]
  ];

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        riseUp = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var scrSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    riseUp = !riseUp;
                  });
                },
                child: AnimatedContainer(
                  curve: Curves.slowMiddle,
                  margin: const EdgeInsets.only(top: 50),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: riseUp
                          ? const Color.fromARGB(255, 253, 227, 255)
                          : const Color(0xFFf7fdfa),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: riseUp ? effectbost[1] : effectbost[0]),
                  duration: const Duration(milliseconds: 1600),
                  child: Column(
                    children: [
                      AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          ColorizeAnimatedText('CONNECT ME',
                              textStyle: GoogleFonts.orbitron(fontSize: 35),
                              colors: colorizeColors,
                              speed: const Duration(milliseconds: 1000))
                        ],
                      ),
                      AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          ColorizeAnimatedText('ON',
                              textStyle: GoogleFonts.orbitron(fontSize: 40),
                              colors: colorizeColors,
                              speed: const Duration(milliseconds: 5000))
                        ],
                      )
                    ],
                  ),
                ),
              )),
          const SizedBox(
            height: 50,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            width: 300,
            height: 400,
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
            decoration: BoxDecoration(
                color: riseUp
                    ? const Color.fromARGB(255, 253, 227, 255)
                    : const Color(0xFFf7fdfa),
                borderRadius: BorderRadius.circular(30),
                boxShadow: riseUp ? effectbost[1] : effectbost[0]),
          )
        ],
      ),
    );
  }
}
