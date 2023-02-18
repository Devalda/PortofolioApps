import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<Widget> projectMecha = [
  Column(
    children: [
      const Divider(
        height: 30,
      ),
      Text(
        "Mechatronic",
        style: GoogleFonts.orbitron(
            fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.bold),
      ),
      Container(
        height: 200,
        width: 150,
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage("assets/foto/forklift.png"))),
      )
    ],
  ),
  Container(
    decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/foto/forklift2.png"))),
  ),
  Container(
    decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/foto/forklift3.png"))),
  ),
  ListView(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Text(
          "In this project , we tried to make a fully automated forklift that run sequence automatically that connected to the cloud for the main central system to integrated to another mechatronic object for the production industrial. It can be controlled by human using wireless joystick controller. It has 3 main brain suposedly for different main task on the client area(for moving automate). The main configuration system for walk is using line detector using infrared sensor and using another sensor for safety measurement. \n it has automated fork that lifted automatically using controlled hydrolic and can lifted up to 500 kilogram",
          textAlign: TextAlign.justify,
          style: GoogleFonts.orbitron(
            fontSize: 10,
            color: const Color.fromARGB(255, 130, 1, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  ),
];

class ProjMecha extends StatefulWidget {
  const ProjMecha({
    super.key,
  });
  // final width;
  // final height;

  @override
  State<ProjMecha> createState() => _ProjMechaState();
}

class _ProjMechaState extends State<ProjMecha>
    with SingleTickerProviderStateMixin {
  late final TabController controller;
  final int _index = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(
        length: projectMecha.length, initialIndex: _index, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: <Widget>[
      TabBarView(
        controller: controller,
        children: projectMecha,
      ),
      Positioned(
          bottom: 20,
          child: TabPageSelector(
            controller: controller,
          ))
    ]);
  }
}
