import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  bool activeUp = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() {
        activeUp = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Stack(children: [
          // header profile view
          Container(),

          // body biodata
          Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0)),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    activeUp = !activeUp;
                  });
                },
                child: AnimatedContainer(
                  curve: Curves.slowMiddle,
                  height: activeUp ? 600 : 200,
                  width: MediaQuery.of(context).size.width,
                  color: activeUp
                      ? const Color.fromARGB(255, 62, 10, 94)
                      : Color.fromARGB(191, 59, 30, 108),
                  duration: const Duration(milliseconds: 800),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
