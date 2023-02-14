import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:rive/rive.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../bridge/apiStoreOpenAi.dart';

class QnA extends StatefulWidget {
  const QnA({super.key});

  @override
  State<QnA> createState() => _QnAState();
}

const backgroundColor = Color(0xff343541);
const botBackgroundColor = Color(0xff444654);

class _QnAState extends State<QnA> {
  final _textController = TextEditingController();

  late SMIBool processing;
  late SMINumber looktext;
  Artboard? artboard;
  late StateMachineController stateMachineController;

  bool isLoading = false;
  bool isUserTyping = false;
  String userInput = "";
  String chatGPToutput =
      "Hello there, Call me Nexus. Im an Artificial Intelegence that being created by openAI corporation. Fell free to ask me anything";
  String botOutput = "";
  int userInputKeyCount = 0;
  int botInputKeyCount = 0;

  // Do something with the response
  Future<String> generateResponse(String prompt) async {
    const apiKey = apiSecretKey;

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

    if (newresponse['choices'][0]['text'] == null) {
      setState(() {
        chatGPToutput = "hmm....   Something is Not Right";
      });
    } else {
      setState(() {
        isLoading = false;
        processing.change(false);
        chatGPToutput = newresponse['choices'][0]['text'];
        print(chatGPToutput);
      });
    }

    return newresponse['choices'][0]['text'];
  }

  sendMessage() {
    setState(() {
      processing.change(true);
      userInput = _textController.text;
      isLoading = true;
    });
    userInputKeyCount += 1;
    _textController.clear();
    generateResponse(userInput);
    // Future.delayed(Duration(seconds: 3), () {
    //   setState(() {
    //     processing.change(false);
    //     isLoading = false;
    //   });
    // });
  }

  movesHeadRive(val) {
    looktext.change(val.length.toDouble());
  }

  @override
  void initState() {
    rootBundle.load('assets/rive/AI.riv').then((value) {
      final file = RiveFile.import(value);
      final art = file.mainArtboard;
      stateMachineController =
          StateMachineController.fromArtboard(art, "State Machine 1")!;

      if (stateMachineController != null) {
        art.addController(stateMachineController);
        for (var element in stateMachineController.inputs) {
          if (element.name == "isHover") {
            processing = element as SMIBool;
          } else if (element.name == "xAxis") {
            looktext = element as SMINumber;
          }
        }
      }

      setState(() {
        artboard = art;
      });
    });
    super.initState();
  }

  //++++++++++++++++++++++++++++++++++ builder ++++++++++++++++++++++++++++++++++++++++++++
  @override
  Widget build(BuildContext context) {
    var MQsize = MediaQuery.of(context).size;
    var MQwidth = MQsize.width;
    var MQheight = MQsize.height;
    return Scaffold(
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
                  SizedBox(
                    width: 400,
                    height: 300,
                    child: Rive(artboard: artboard!),
                  ),
                  Container(
                    width: MQwidth,
                    height: MQheight * 0.75,
                    color: Color.fromRGBO(57, 57, 57, 0.248),
                    child: GestureDetector(
                      onTap: () =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      child: ListView(
                        children: [
                          Column(
                            children: [
                              Divider(
                                height: MQheight * 0.25,
                              ),
                              // bots profile
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 100,
                                        left: 20,
                                      ),
                                      child: AnimatedSwitcher(
                                        duration: const Duration(seconds: 1),
                                        child: Container(
                                          key: ValueKey(botInputKeyCount),
                                          constraints: BoxConstraints(
                                              maxWidth: 270, minWidth: 100),
                                          decoration: BoxDecoration(
                                              color:
                                                  Color.fromARGB(190, 0, 0, 0),
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
                                              child: isLoading
                                                  ? SpinKitSpinningLines(
                                                      color: Colors.grey,
                                                    )
                                                  : Text(
                                                      chatGPToutput,
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
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
                                  ],
                                ),
                              ),
                              // bots message
                              // user profile
                              const Divider(
                                height: 100,
                              ),
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
                                              maxWidth:
                                                  isUserTyping ? 100 : 270,
                                              minWidth: 100),
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
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
                                                      color: Color.fromARGB(
                                                              255, 69, 42, 143)
                                                          .withOpacity(0.6),
                                                    )
                                                  : Text(
                                                      userInput,
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                      key: ValueKey(
                                                          userInputKeyCount),
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
                      width: 20,
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
                            onChanged: ((val) => movesHeadRive(val)),
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
