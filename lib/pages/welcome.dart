import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../route/name_route.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool _isElevated = true;
  late AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // body: Center(child: CircularProgressIndicator()),
        backgroundColor: Colors.grey[300],
        body: Center(
            child: GestureDetector(
          onTap: () {
            setState(() {
              _isElevated = !_isElevated;
            });
            Get.toNamed(RouteName.home);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 500,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(50),
              boxShadow: _isElevated
                  ? [
                      BoxShadow(
                        color: Colors.grey[500]!,
                        offset: const Offset(4, 4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      )
                    ]
                  : null,
            ),
            child: const SizedBox(
                width: 200,
                height: 300,
                child: Center(
                  child: Text('Welcome to'),
                )),
          ),
        )),
      ),
    );
  }
}
