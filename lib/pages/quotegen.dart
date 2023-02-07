// ignore_for_file: unnecessary_new
import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:devaldaporto/controllers/repo_respond.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import '../controllers/quotes_model.dart';

class QuoteGen extends StatefulWidget {
  @override
  State<QuoteGen> createState() => _QuoteGenState();
}

class _QuoteGenState extends State<QuoteGen> {
  // ignore: non_constant_identifier_names
  var MQwidth, MQsize;

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
      setState(() {
        isHUD = true;
      });
    });
    getData();
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

  @override
  void dispose() {
    listViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MQsize = MediaQuery.of(context).size;
    MQwidth = MQsize.width;
    return Scaffold(
      extendBodyBehindAppBar: isHUD ? true : false,
      body: GestureDetector(
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
                if (index < listBlog.length) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 253, 229, 254),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            color: const Color.fromARGB(255, 174, 166, 166),
                            offset: Offset(4, 4),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: const Color.fromARGB(255, 239, 238, 238),
                            offset: const Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Align(
                              alignment: Alignment.topLeft,
                              child: Icon(
                                FontAwesomeIcons.quoteLeft,
                                size: 40.50,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: GestureDetector(
                              onDoubleTap: () => {
                                HapticFeedback.vibrate(),
                                selectedLovedIndex = index,
                                setState(() {
                                  isShowLiked = true;
                                }),
                                Future.delayed(
                                    const Duration(milliseconds: 1200), () {
                                  setState(() {
                                    isShowLiked = false;
                                    Get.snackbar("You Liked Quotes From",
                                        listBlog[index].author,
                                        snackPosition: SnackPosition.TOP,
                                        margin: const EdgeInsets.all(60.0),
                                        borderWidth: 2,
                                        borderColor:
                                            Color.fromARGB(255, 114, 25, 203),
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
                                    const Duration(milliseconds: 1200), () {
                                  setState(() {
                                    isShowLiked = false;
                                    Get.snackbar("You Liked Quotes From",
                                        listBlog[index].author,
                                        snackPosition: SnackPosition.BOTTOM,
                                        margin: const EdgeInsets.all(60.0),
                                        borderWidth: 2,
                                        borderColor:
                                            Color.fromARGB(255, 114, 25, 203),
                                        forwardAnimationCurve:
                                            Curves.elasticInOut,
                                        shouldIconPulse: true);
                                  });
                                }),
                              },
                              child: Text(
                                listBlog[index].quoteText,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    ?.copyWith(
                                      color: Colors.grey.shade800,
                                      fontSize: 40.0,
                                    ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.primaries[
                                Random().nextInt(Colors.primaries.length)],
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
                                    color: Colors.grey.shade600,
                                    fontSize: 20.0),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          isShowLiked
              ? const Positioned.fill(
                  child: RiveAnimation.asset(
                    "assets/RiveAssets/Love.riv",
                  ),
                )
              : SizedBox(),
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0)),
            child: AnimatedContainer(
              curve: Curves.decelerate,
              duration: const Duration(milliseconds: 500),
              width: MQwidth,
              alignment: AlignmentDirectional.topStart,
              height: isHUD ? 100 : 0,
              color: isHUD
                  ? const Color.fromARGB(213, 94, 13, 100)
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
                          Get.snackbar("Like the Quotes?",
                              "try DoubleTap or LongPressed it",
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
    );
  }
}
