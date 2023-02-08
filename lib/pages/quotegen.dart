// ignore_for_file: unnecessary_new
import 'dart:ffi';
import 'dart:math';
import 'dart:ui';
import 'package:devaldaporto/controllers/repo_respond.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import '../controllers/quotes_model.dart';
import 'package:flutter/src/painting/gradient.dart' as FG;

class QuoteGen extends StatefulWidget {
  @override
  State<QuoteGen> createState() => _QuoteGenState();
}

class _QuoteGenState extends State<QuoteGen> {
  // ignore: non_constant_identifier_names
  var MQwidth, MQsize, MQheight;

  final listViewController = ScrollController();
  List<Blog> listBlog = [];
  RRespond rRespond = RRespond();
  bool riseUp = true;
  bool isShowLiked = false;
  int selectedLovedIndex = 0;
  bool isHUD = false;

  getData() async {
    listBlog = await rRespond.getData();
    // V anti crash crash club ^ async
    if (!mounted) return;
    setState(() {
      riseUp = false;
    });
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 800), () {
      if (!mounted) return;
      setState(() {
        isHUD = true;
      });
    });
    getData();
    if (!mounted) return;
    listViewController.addListener(() {
      if (listViewController.position.maxScrollExtent ==
          listViewController.offset) {
        fetch();
      }
    });
    super.initState();
  }

  Future fetch() async {
    List<Blog> newlistBlog = await rRespond.getData();
    newlistBlog = await rRespond.getData();
    if (!mounted) return;
    setState(() {
      for (var element in newlistBlog) {
        listBlog.add(element);
      }
    });
  }

  Future<void> refresh() async {
    List<Blog> newlistBlog = await rRespond.getData();
    if (!mounted) return;
    setState(() {
      listBlog = newlistBlog;
    });
  }

  // @override
  // void dispose() {
  //   listViewController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final Function(String value) onLiked;
    MQsize = MediaQuery.of(context).size;
    MQwidth = MQsize.width;
    MQheight = MQsize.height;
    return Scaffold(
      extendBodyBehindAppBar: isHUD ? true : false,
      body: Stack(children: [
        RotatedBox(
          quarterTurns: 3,
          child: SizedBox(
            height: MQwidth,
            width: MQheight,
            child: const RiveAnimation.asset(
              fit: BoxFit.cover,
              "assets/RiveAssets/Cosmos.riv",
              artboard: "New Artboard",
              // onInit:
            ),
          ),
        ),
        GestureDetector(
          onScaleStart: (detail) {
            setState(() {
              isHUD = !isHUD;
            });
          },
          onTap: () {
            setState(() {
              isHUD = !isHUD;
            });
          },
          child: Stack(children: [
            RefreshIndicator(
              color: Colors.deepPurpleAccent,
              onRefresh: refresh,
              child: ListView.builder(
                controller: listViewController,
                itemCount: listBlog.length + 1,
                itemBuilder: (context, index) {
                  bool isLiked = false;
                  if (index < listBlog.length) {
                    return Dismissible(
                      key: ValueKey<Blog>(listBlog[index]),
                      onDismissed: (DismissDirection direction) {
                        setState(() {
                          listBlog.removeAt(index);
                        });
                      },
                      background: Container(
                        color: Colors.black.withOpacity(0.1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(27),
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.05),
                                      width: 3.5),
                                  gradient: FG.LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Colors.white.withOpacity(0.25),
                                        Colors.white.withOpacity(0.20),
                                        Colors.white.withOpacity(0.15),
                                        Colors.white.withOpacity(0.10),
                                      ])),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(left: 20, top: 20),
                                        child: Icon(
                                          color: Colors.white,
                                          FontAwesomeIcons.quoteLeft,
                                          size: 40.50,
                                        ),
                                      )),
                                  GestureDetector(
                                    onDoubleTap: () => {
                                      HapticFeedback.vibrate(),
                                      selectedLovedIndex = index,
                                      setState(() {
                                        isLiked = true;
                                        isShowLiked = true;
                                      }),
                                      Future.delayed(
                                          const Duration(milliseconds: 1200),
                                          () {
                                        setState(() {
                                          isShowLiked = false;
                                          Get.snackbar(
                                              colorText: Colors.white,
                                              "You Liked Quotes From",
                                              listBlog[index].author,
                                              snackPosition: SnackPosition.TOP,
                                              margin:
                                                  const EdgeInsets.all(60.0),
                                              borderWidth: 2,
                                              borderColor: Color.fromARGB(
                                                  255, 114, 25, 203),
                                              forwardAnimationCurve:
                                                  Curves.elasticInOut,
                                              shouldIconPulse: true);
                                        });
                                      }),
                                    },
                                    onLongPress: () => {
                                      HapticFeedback.vibrate(),
                                      setState(() {
                                        isShowLiked = true;
                                      }),
                                      Future.delayed(
                                          const Duration(milliseconds: 1200),
                                          () {
                                        setState(() {
                                          isShowLiked = false;
                                          Get.snackbar(
                                              "You Liked Quotes From",
                                              colorText: Colors.white,
                                              listBlog[index].author,
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                              margin:
                                                  const EdgeInsets.all(60.0),
                                              borderWidth: 2,
                                              borderColor: Color.fromARGB(
                                                  255, 114, 25, 203),
                                              forwardAnimationCurve:
                                                  Curves.elasticInOut,
                                              shouldIconPulse: true);
                                        });
                                      }),
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(40.0),
                                      child: Text(
                                        listBlog[index].quoteText,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3
                                            ?.copyWith(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: 40.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.primaries[Random()
                                        .nextInt(Colors.primaries.length)],
                                    thickness: 2,
                                    indent: 60,
                                    endIndent: 60,
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    listBlog[index].author,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.copyWith(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 20.0),
                                    textAlign: TextAlign.center,
                                  ),
                                  Container(
                                    alignment: Alignment.bottomRight,
                                    child: isLiked
                                        ? const SizedBox(
                                            width: 150,
                                            height: 150,
                                          )
                                        : const SizedBox(
                                            width: 150,
                                            height: 150,
                                            child: RiveAnimation.asset(
                                              "assets/RiveAssets/Love2.riv",
                                              animations: ["Hover"],
                                            ),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 32),
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    );
                  }
                },
              ),
            ),
            isShowLiked
                ? const Positioned.fill(
                    child: RiveAnimation.asset(
                      "assets/RiveAssets/Love2.riv",
                      animations: ["Pressed"],
                    ),
                  )
                : SizedBox(),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)),
              child: AnimatedContainer(
                curve: Curves.decelerate,
                duration: const Duration(milliseconds: 500),
                width: MQwidth,
                alignment: AlignmentDirectional.topStart,
                height: isHUD ? 100 : 0,
                color: isHUD
                    ? Color.fromARGB(224, 62, 8, 66)
                    : const Color.fromARGB(0, 94, 13, 100),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: const EdgeInsets.only(left: 80, top: 40),
                    child: Row(children: [
                      Text("Quotes from Clouds",
                          style: GoogleFonts.orbitron(
                              fontSize: 20, color: Colors.white)),
                      const SizedBox(
                        width: 30,
                      ),
                      IconButton(
                          onPressed: () {
                            Get.snackbar(
                                "LOVED or HATED",
                                colorText: Colors.white,
                                "try SWIPE OR DOUBLETAP",
                                snackPosition: SnackPosition.BOTTOM,
                                margin: const EdgeInsets.all(60.0),
                                borderWidth: 2,
                                borderColor: Color.fromARGB(255, 146, 8, 159),
                                forwardAnimationCurve: Curves.elasticInOut,
                                shouldIconPulse: true);
                          },
                          icon: const Icon(
                            Icons.question_mark_outlined,
                            color: Colors.white,
                          ))
                    ]),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
