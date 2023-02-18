import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:rive/rive.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../auth/secret.dart';
import '../dialogs/apiGPTrequest.dart';

class QnA extends StatefulWidget {
  const QnA({super.key});

  @override
  State<QnA> createState() => _QnAState();
}

const backgroundColor = Color(0xff343541);
const botBackgroundColor = Color(0xff444654);

class _QnAState extends State<QnA> {
  final _textController = TextEditingController();
  var MQwidth, MQsize, MQheight;

  late SMIBool processing;
  late SMINumber looktext;
  Artboard? artboard;
  late StateMachineController stateMachineController;

  bool startUp = true;
  bool isBooting = true;
  bool isLoading = false;
  bool isUserTyping = false;
  String userInput = "";
  String chatGPToutput =
      "Hello there, Call me Nexus.\nIm an Artificial Intelligence that being created by openAI corporation. \nFeel free to ask me anything";
  String botOutput = "";
  int userInputKeyCount = 0;
  int botInputKeyCount = 0;

  // Do something with the response
  Future<String> generateResponse(String prompt) async {
    String responeOpenAI = "";
    const apiKey = apiSecretKey;
    try {
      var url = Uri.https("api.openai.com", "/v1/completions");
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $apiKey"
        },
        body: json.encode({
          "model": "text-davinci-003",
          "prompt": prompt,
          'temperature': 0,
          'max_tokens': 200,
          'top_p': 1,
          'frequency_penalty': 0.0,
          'presence_penalty': 0.0,
        }),
      );

      // Do something with the response
      Map<String, dynamic> newresponse = jsonDecode(response.body);

      setState(() {
        isLoading = false;
        looktext.change(0);
        chatGPToutput = newresponse['choices'][0]['text'];
        responeOpenAI = chatGPToutput;
        print(chatGPToutput);
      });
    } on NoSuchMethodError catch (e) {
      print(e);
      setState(() {
        looktext.change(3);
        chatGPToutput =
            "Arghh...   Something is Not Right! \nmy Connection to the Central System is being cut off! \nplease contact my creator on the last tabs in navigation bar! ";
        responeOpenAI = chatGPToutput;
      });
    }
    return responeOpenAI;
  }

  keyboardHeigh() {
    final viewInsets = EdgeInsets.fromWindowPadding(
        WidgetsBinding.instance.window.viewInsets,
        WidgetsBinding.instance.window.devicePixelRatio);
    final keyboard = MQheight * 0.82 - viewInsets.bottom;
    print(keyboard);
    return keyboard;
  }

  sendMessage() {
    setState(() {
      looktext.change(2);
      processing.change(false);
      isBooting = false;
      userInput = _textController.text;
      isLoading = true;
    });
    userInputKeyCount += 1;
    _textController.clear();
    generateResponse(userInput);
    // Future.delayed(const Duration(seconds: 3), () {
    //   setState(() {
    //     looktext.change(0);
    //     processing.change(false);
    //     isLoading = false;
    //     // movesHeadRive(_textController.text.length);
    //   });
    // });
  }

  movesHeadRive(val) {
    looktext.change(val.length.toDouble());
  }

  _defineArtboard() {
    rootBundle.load('assets/RiveAssets/AI2.riv').then((value) {
      final file = RiveFile.import(value);
      final art = file.mainArtboard;
      stateMachineController =
          StateMachineController.fromArtboard(art, "State Machine 1")!;

      art.addController(stateMachineController);
      for (var element in stateMachineController.inputs) {
        if (element.name == "isPressed") {
          processing = element as SMIBool;
        } else if (element.name == "States") {
          looktext = element as SMINumber;
        }
      }
      setState(() {
        artboard = art;
      });
    });
  }

  @override
  void initState() {
    _defineArtboard();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        startUp = false;
      });
    });
    super.initState();
  }

  //++++++++++++++++++++++++++++++++++ builder ++++++++++++++++++++++++++++++++++++++++++++
  @override
  Widget build(BuildContext context) {
    MQsize = MediaQuery.of(context).size;
    MQwidth = MQsize.width;
    MQheight = MQsize.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Stack(
        children: [
          Stack(
            children: [
              Container(
                child: startUp
                    ? SizedBox(
                        width: MQwidth,
                        height: 400,
                        child: const SpinKitDancingSquare(
                            size: 185,
                            color: Color.fromARGB(255, 161, 69, 177)),
                      )
                    : AnimatedContainer(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.elasticInOut,
                        height: isUserTyping ? MQheight * 0.21 : MQheight * 0.5,
                        child: SizedBox(
                          width: MQwidth,
                          //
                          child: artboard == null
                              ? SizedBox(
                                  width: MQwidth,
                                )
                              : Rive(artboard: artboard!),
                        ),
                      ),
              ),
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/foto/purple_room.png'),
                        fit: BoxFit.fill)),
              ),
            ],
          ),
          SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Container(
                    width: MQwidth,
                    height: isUserTyping ? keyboardHeigh() : MQheight * 0.72,
                    color: Colors.transparent,
                    child: GestureDetector(
                      onTap: () =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      child: ListView(
                        children: [
                          Column(
                            children: [
                              AnimatedSize(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.fastLinearToSlowEaseIn,
                                child: Divider(
                                  height: isUserTyping
                                      ? MQheight * 0.05
                                      : MQheight * 0.28,
                                ),
                              ),
                              // bots profile
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 80,
                                        left: 20,
                                      ),
                                      child: AnimatedSwitcher(
                                        duration: const Duration(seconds: 1),
                                        child: GestureDetector(
                                          onTap: () => processing.change(true),
                                          onDoubleTap: () =>
                                              processing.change(false),
                                          onLongPress: () =>
                                              processing.change(false),
                                          child: Container(
                                            key: ValueKey(botInputKeyCount),
                                            constraints: BoxConstraints(
                                                maxWidth: MQwidth * 0.75,
                                                minWidth: MQwidth * 0.1),
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    190, 0, 0, 0),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 2)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: AnimatedOpacity(
                                                duration:
                                                    const Duration(seconds: 3),
                                                opacity: startUp ? 0 : 1,
                                                curve: Curves.bounceInOut,
                                                child: AnimatedSwitcher(
                                                  duration: const Duration(
                                                      milliseconds: 100),
                                                  child: isLoading
                                                      ? const SpinKitSpinningLines(
                                                          color: Colors.grey,
                                                        )
                                                      : Text(
                                                          chatGPToutput,
                                                          style:
                                                              const TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          255)),
                                                          key: ValueKey(
                                                              botInputKeyCount),
                                                        ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // bots message
                              // user profile
                              Divider(
                                  height: isUserTyping
                                      ? MQheight * 0
                                      : MQheight * 0.01),
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    // user message
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, bottom: 50),
                                      child: AnimatedSwitcher(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        child: Container(
                                          key: ValueKey(userInputKeyCount),
                                          constraints: BoxConstraints(
                                              maxWidth: isUserTyping
                                                  ? MQwidth * 0.3
                                                  : MQwidth * 0.75,
                                              minWidth: MQwidth * 0.3),
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  240, 255, 255, 255),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey,
                                                  width: 2)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: AnimatedSwitcher(
                                              duration: const Duration(
                                                  milliseconds: 100),
                                              child: isUserTyping
                                                  ? const SpinKitSquareCircle(
                                                      key: ValueKey(1),
                                                      size: 30,
                                                      color: Color.fromARGB(
                                                          255, 75, 26, 173))
                                                  : Container(
                                                      child: isBooting
                                                          ? SizedBox(
                                                              width: 200.0,
                                                              height: 70,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child:
                                                                    AnimatedTextKit(
                                                                  pause: const Duration(
                                                                      seconds:
                                                                          2),
                                                                  repeatForever:
                                                                      true,
                                                                  animatedTexts:
                                                                      hintTextUserRotating,
                                                                ),
                                                              ),
                                                            )
                                                          : Text(
                                                              userInput,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                              key: ValueKey(
                                                                  userInputKeyCount),
                                                            ),
                                                    ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // ================================= bottom field =============================================
              Container(
                height: MQheight * 0.1,
                color: Color.fromARGB(0, 0, 0, 0),
                child: Row(
                  children: [
                    SizedBox(
                      width: MQwidth * 0.05,
                    ),
                    Expanded(
                      child: FocusScope(
                        child: Focus(
                          onFocusChange: (focus) {
                            setState(() {
                              isUserTyping = !isUserTyping;
                            });
                          },
                          child: TextField(
                            onSubmitted: ((value) => sendMessage()),
                            onChanged: ((val) => looktext.change(1)),
                            textCapitalization: TextCapitalization.sentences,
                            style: const TextStyle(color: Colors.white),
                            controller: _textController,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color: Color.fromARGB(255, 74, 44, 154))),
                              hintText: "Ask anything to Nexus",
                              hintStyle: TextStyle(color: Colors.white),
                              fillColor: Color.fromARGB(188, 46, 46, 46),
                              hoverColor: Color.fromARGB(255, 59, 36, 123),
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          sendMessage();
                        },
                        icon: const Icon(
                          FontAwesomeIcons.arrowTurnUp,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
