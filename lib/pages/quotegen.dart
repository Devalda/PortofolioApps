// ignore_for_file: unnecessary_new
import 'dart:math';
import 'package:devaldaporto/controllers/repo_respond.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controllers/quotes_model.dart';

class QuoteGen extends StatefulWidget {
  @override
  State<QuoteGen> createState() => _QuoteGenState();
}

class _QuoteGenState extends State<QuoteGen> {
  List<Blog> listBlog = [];
  RRespond rRespond = RRespond();

  getData() async {
    listBlog = await rRespond.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool isScrolled) {
          return [
            const SliverAppBar(
              backgroundColor: Colors.tealAccent,
              title: Text('API Generated Quotes'),
              centerTitle: true,
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
                      onDoubleTap: () => {
                        HapticFeedback.vibrate(),
                        Get.defaultDialog(
                            title: "You Like",
                            middleText: listBlog[index].author)
                      },
                      child: Text(
                        listBlog[index].quoteText,
                        style: Theme.of(context).textTheme.headline3?.copyWith(
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
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: Colors.grey.shade600, fontSize: 20.0),
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
    );
  }
}
