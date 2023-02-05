// ignore_for_file: unnecessary_new
import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:devaldaporto/controllers/repo_respond.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../controllers/quotes_model.dart';

class QuoteGen extends StatefulWidget {
  @override
  State<QuoteGen> createState() => _QuoteGenState();
}

class _QuoteGenState extends State<QuoteGen> {
  List<Blog> listBlog = [];
  RRespond rRespond = RRespond();
  bool isConffeti = false;
  final confecontroller = ConfettiController();

  @override
  void dispose() {
    confecontroller.dispose();
    super.dispose();
  }

  getData() async {
    listBlog = await rRespond.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    confecontroller.addListener(() {
      isConffeti = confecontroller.state == ConfettiControllerState.playing;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Scaffold(
        extendBody: true,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool isScrolled) {
            return [
              SliverAppBar(
                actions: [
                  IconButton(
                    icon: const Icon(Icons.question_mark_outlined),
                    onPressed: () {
                      Get.snackbar("You can like the quotes",
                          "by pressing or double tap",
                          snackPosition: SnackPosition.BOTTOM,
                          margin: const EdgeInsets.all(60.0),
                          borderWidth: 2,
                          borderColor: Color(0xFFb8a5cb),
                          forwardAnimationCurve: Curves.elasticInOut,
                          shouldIconPulse: true);
                    },
                  )
                ],
                backgroundColor: Color.fromARGB(188, 238, 174, 131),
                title: const Text(
                  'API Generated Quotes',
                  style: TextStyle(color: Color(0xFFfff4e6)),
                ),
                centerTitle: true,
                elevation: 10,
              )
            ];
          },
          body: ListView.builder(
            itemCount: listBlog.length,
            itemBuilder: (context, index) {
              return new Padding(
                padding: const EdgeInsets.all(16.0),
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
                        onTap: () => confecontroller.stop(),
                        onTapUp: ((details) => confecontroller.stop()),
                        onDoubleTap: () => {
                          HapticFeedback.vibrate(),
                          confecontroller.play(),
                          Get.snackbar(
                              "You Liked Quotes From", listBlog[index].author,
                              snackPosition: SnackPosition.TOP,
                              margin: const EdgeInsets.all(60.0),
                              borderWidth: 2,
                              borderColor: Color(0xFFf4d096),
                              forwardAnimationCurve: Curves.elasticInOut,
                              shouldIconPulse: true)
                        },
                        onLongPress: () => {
                          HapticFeedback.vibrate(),
                          confecontroller.play(),
                          Get.snackbar(
                              "You Liked Quotes From", listBlog[index].author,
                              snackPosition: SnackPosition.BOTTOM,
                              margin: const EdgeInsets.all(60.0),
                              borderWidth: 2,
                              borderColor: Color(0xFFf4d096),
                              forwardAnimationCurve: Curves.elasticInOut,
                              shouldIconPulse: true)
                        },
                        child: Text(
                          listBlog[index].quoteText,
                          style:
                              Theme.of(context).textTheme.headline3?.copyWith(
                                    color: Colors.grey.shade800,
                                    fontSize: 40.0,
                                  ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
                      thickness: 2,
                      indent: 60,
                      endIndent: 60,
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      listBlog[index].author,
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: Colors.grey.shade600, fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              );
              // return new ListTile(
              //   title: Text(listBlog[index].quoteText),
              //   subtitle: Text(listBlog[index].author),
              //   focusColor: Colors.teal,
              //   isThreeLine: true,
              //   minVerticalPadding: 50,
              // );
              // return Container(child: Text(listBlog[index].quoteText) ,child: Text(listBlog[index].author));
            },
          ),
        ),
      ),
      ConfettiWidget(
        confettiController: confecontroller,
        blastDirectionality: BlastDirectionality.explosive,
        numberOfParticles: 5,
        maxBlastForce: 50,
      ),
    ]);
  }
}
