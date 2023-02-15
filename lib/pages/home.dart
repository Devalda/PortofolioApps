import 'package:devaldaporto/pages/Ai_gpt.dart';
import 'package:devaldaporto/pages/mymedia.dart';
import 'package:devaldaporto/pages/profile.dart';
import 'package:devaldaporto/pages/quotegen.dart';
import 'package:devaldaporto/utils/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as flumat;
import 'package:rive/rive.dart';
import 'myproject.dart';

const TextStyle _textStyle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
    fontStyle: FontStyle.italic);

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  RiveAssets selectedBotNav = bottomNavs.first;

  final gradientColor = const [
    [
      Color.fromARGB(190, 127, 56, 186),
      Color.fromARGB(168, 58, 14, 94),
      Color.fromARGB(168, 58, 14, 94),
      Color.fromARGB(168, 58, 14, 94),
      Color.fromARGB(168, 58, 14, 94),
    ],
    [
      Color.fromARGB(168, 58, 14, 94),
      Color.fromARGB(190, 127, 56, 186),
      Color.fromARGB(168, 58, 14, 94),
      Color.fromARGB(168, 58, 14, 94),
      Color.fromARGB(168, 58, 14, 94),
    ],
    [
      Color.fromARGB(168, 58, 14, 94),
      Color.fromARGB(168, 58, 14, 94),
      Color.fromARGB(190, 127, 56, 186),
      Color.fromARGB(168, 58, 14, 94),
      Color.fromARGB(168, 58, 14, 94),
    ],
    [
      Color.fromARGB(168, 58, 14, 94),
      Color.fromARGB(168, 58, 14, 94),
      Color.fromARGB(168, 58, 14, 94),
      Color.fromARGB(190, 127, 56, 186),
      Color.fromARGB(168, 58, 14, 94),
      Color.fromARGB(168, 58, 14, 94),
    ],
    [
      Color.fromARGB(168, 58, 14, 94),
      Color.fromARGB(168, 58, 14, 94),
      Color.fromARGB(168, 58, 14, 94),
      Color.fromARGB(168, 58, 14, 94),
      Color.fromARGB(168, 58, 14, 94),
      Color.fromARGB(190, 127, 56, 186),
    ],
  ];

  int _currentIndex = 0;
  final pageSelected = [QuoteGen(), QnA(), Profile(), MyProject(), MyMedia()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageSelected[_currentIndex],
      resizeToAvoidBottomInset: false,
      extendBody: true,
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(18, 12, 18, 5),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
              gradient: flumat.LinearGradient(
                end: Alignment.topRight,
                begin: Alignment.bottomLeft,
                colors: gradientColor[_currentIndex],
              ),
              borderRadius: BorderRadius.all(Radius.circular(24))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                bottomNavs.length,
                (index) => GestureDetector(
                  onTap: () {
                    if (bottomNavs[index] != selectedBotNav) {
                      setState(() {
                        selectedBotNav = bottomNavs[index];
                        _currentIndex = index;
                      });
                    }
                    bottomNavs[index].inputs!.change(true);
                    Future.delayed(const Duration(seconds: 2), () {
                      bottomNavs[index].inputs!.change(false);
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                          height: 36,
                          width: 36,
                          child: Opacity(
                            opacity:
                                bottomNavs[index] == selectedBotNav ? 1 : 0.5,
                            child: RiveAnimation.asset(
                              "assets/RiveAssets/Icons.riv",
                              artboard: bottomNavs[index].artboard,
                              onInit: (artboard) {
                                StateMachineController controller =
                                    RiveUtils.getRiveController(artboard,
                                        stateMachineName:
                                            bottomNavs[index].stateMachineName);
                                bottomNavs[index].inputs =
                                    controller.findSMI("active") as SMIBool;
                              },
                            ),
                          )),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.only(bottom: 2),
                        height: 4,
                        width: bottomNavs[index] == selectedBotNav ? 25 : 0,
                        decoration: const BoxDecoration(
                            color: Color(0xFFfa6435),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RiveAssets {
  final String artboard, stateMachineName, title, src;
  late SMIBool? inputs;

  RiveAssets(
      {required this.src,
      required this.artboard,
      required this.stateMachineName,
      required this.title,
      this.inputs});

  set setInput(SMIBool status) {
    inputs = status;
  }
}

List<RiveAssets> bottomNavs = [
  RiveAssets(
    src: "assets/RiveAssets/Icons.riv",
    artboard: "HOME",
    stateMachineName: "HOME_Interactivity",
    title: "home",
  ),
  RiveAssets(
    src: "assets/RiveAssets/Icons.riv",
    artboard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "chat",
  ),
  RiveAssets(
    src: "assets/RiveAssets/Icons.riv",
    artboard: "USER",
    stateMachineName: "USER_Interactivity",
    title: "user",
  ),
  RiveAssets(
    src: "assets/RiveAssets/Icons.riv",
    artboard: "BELL",
    stateMachineName: "BELL_Interactivity",
    title: "bell",
  ),
  RiveAssets(
    src: "assets/RiveAssets/Icons.riv",
    artboard: "SEARCH",
    stateMachineName: "SEARCH_Interactivity",
    title: "search",
  ),
];
