import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class projUX extends StatefulWidget {
  const projUX({super.key});

  @override
  State<projUX> createState() => _projUXState();
}

List<Widget> ProjectUX = [
  Container(
      child: Column(children: [
    const Divider(
      height: 30,
    ),
    Text(
      "UI/UX",
      style: GoogleFonts.orbitron(
          fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.bold),
    ),
    Container(
      height: 200,
      width: 150,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/foto/ux_dev.png"))),
    )
  ])),
  Container(
    height: 200,
    width: 150,
    decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/foto/tkb1.jpg"))),
  ),
  Container(
    height: 200,
    width: 150,
    decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/foto/tkb2.jpg"))),
  ),
  Container(
    height: 200,
    width: 150,
    decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/foto/tkb3.jpg"))),
  ),
  Expanded(
      child: ListView(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Text(
          "Im an Information student, and of course i ever created And apps or website , i can make an UseCase diagram , State Machine Diagram , UX , Flow Diagram , Ui for website and apps ,managing Data realtional database , and i ever internship doing backend developer using django framework that creating some state and function and create and update some table using django(This kinda frustate since that project didnt have software analysis, so i must configure alone or analysis alone and coding it too. And do some software engineer like that is more hard since we can't find out the error imediately. not all the progress has the output and some case we even make the error configuration by our self, so how we suposed to know something went wrong when we didn't know whats wrong lol.(*ehem there is called software testing *but im inexperience) Not like the mechatornic developer and Ui developer that we can get the output as fast as we want so we cant know immediately some thing is wrong. Oh i can do video editing, movie maker, and some drawing sketch that is  because art ismy hobby. So yeah, thats the reason i choose front end developer know) ",
          textAlign: TextAlign.justify,
          style: GoogleFonts.orbitron(
            fontSize: 10,
            color: const Color.fromARGB(255, 130, 1, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  )),
];

class _projUXState extends State<projUX> with SingleTickerProviderStateMixin {
  late final TabController controller;
  int _index = 0;

  @override
  void initState() {
    // TODO: implement initState
    controller = TabController(
        length: ProjectUX.length, initialIndex: _index, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Stack(alignment: Alignment.center, children: <Widget>[
          TabBarView(
            controller: controller,
            children: ProjectUX,
          ),
          Positioned(
              bottom: 20,
              child: TabPageSelector(
                controller: controller,
              ))
        ]),
      ),
    );
  }
}
