import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:rive/rive.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../auth/secret.dart';

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
            "Arghh...   Something is Not Right! \n my Connection to the Central System is being cut off! \n please contact my creator on the last tabs in navigation bar! ";
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
      isBooting = false;
      looktext.change(2);
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

  @override
  void initState() {
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
    super.initState();
  }

  List<AnimatedText> hintTextUserRotating = [
    TypewriterAnimatedText('Get me sandwich recipe'),
    TypewriterAnimatedText(
        'Whats is a wormholes.\nExplain like iam 8 years old'),
    TypewriterAnimatedText('Make a simple code in python'),
    TypewriterAnimatedText(
        'Explain the HTTPS stack to me and doit like a cowboy from old western'),
    TypewriterAnimatedText('Who is the president of indonesia'),
    TypewriterAnimatedText(
        'Debug my code and translate it from javascript to ruby '),
    TypewriterAnimatedText('Write some GoLang code'),
    TypewriterAnimatedText('Help me with my Geography Assignment'),
    TypewriterAnimatedText('Write me some Youtube Script'),
    TypewriterAnimatedText('Translate my words into spanish'),
    TypewriterAnimatedText(
        'Write a song about love \nwith accompanying chords'),
    TypewriterAnimatedText(
        'Make me an essay about natural selection in biology'),
  ];

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
          Expanded(
            child: Container(
              color: Colors.black,
            ),
          ),
          SafeArea(
              child: Column(
            children: [
              Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    child: SizedBox(
                      width: MQwidth,
                      height: isUserTyping ? MQheight * 0.2 : MQheight * 0.3,
                      child: Rive(artboard: artboard!),
                    ),
                  ),
                  Container(
                    width: MQwidth,
                    height: isUserTyping ? keyboardHeigh() : MQheight * 0.72,
                    color: const Color.fromRGBO(57, 57, 57, 0.248),
                    child: GestureDetector(
                      onTap: () =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      child: ListView(
                        children: [
                          Column(
                            children: [
                              Divider(
                                height: isUserTyping
                                    ? MQheight * 0.05
                                    : MQheight * 0.15,
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
                                          onTapCancel: () =>
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
                                              child: AnimatedSwitcher(
                                                duration: const Duration(
                                                    milliseconds: 100),
                                                child: isLoading
                                                    ? const SpinKitSpinningLines(
                                                        color: Colors.grey,
                                                      )
                                                    : Text(
                                                        chatGPToutput,
                                                        style: const TextStyle(
                                                            color:
                                                                Color.fromARGB(
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
                                  ],
                                ),
                              ),
                              // bots message
                              // user profile
                              Divider(
                                  height: isUserTyping
                                      ? MQheight * 0.01
                                      : MQheight * 0.11),
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
                                                  194, 255, 255, 255),
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
                                                  ? SpinKitSquareCircle(
                                                      key: ValueKey(1),
                                                      size: 30,
                                                      color:
                                                          const Color.fromARGB(
                                                                  255,
                                                                  69,
                                                                  42,
                                                                  143)
                                                              .withOpacity(0.6),
                                                    )
                                                  : Container(
                                                      child: isBooting
                                                          ? SizedBox(
                                                              width: 200.0,
                                                              height: 50,
                                                              child:
                                                                  AnimatedTextKit(
                                                                pause:
                                                                    const Duration(
                                                                        seconds:
                                                                            2),
                                                                repeatForever:
                                                                    true,
                                                                animatedTexts:
                                                                    hintTextUserRotating,
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
                color: Colors.black,
                child: Row(
                  children: [
                    SizedBox(
                      width: MQwidth * 0.08,
                    ),
                    Expanded(
                      child: FocusScope(
                        child: Focus(
                          onFocusChange: (focus) {
                            setState(() {
                              isUserTyping = !isUserTyping;
                            });
                          },
                          child: TextFormField(
                            onChanged: ((val) => looktext.change(1)),
                            textCapitalization: TextCapitalization.sentences,
                            style: const TextStyle(color: Colors.white),
                            controller: _textController,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color: Color.fromARGB(255, 74, 44, 154))),
                              labelText: "Ask anything to Nexus",
                              labelStyle: TextStyle(color: Colors.white),
                              fillColor: Color.fromARGB(255, 46, 46, 46),
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
                          Icons.send_rounded,
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
