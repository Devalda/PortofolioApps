import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class projElectro extends StatefulWidget {
  const projElectro({super.key});

  @override
  State<projElectro> createState() => _projElectroState();
}

List<Widget> projectElectro = [
  Column(children: [
    const Divider(
      height: 30,
    ),
    Text(
      "Electro",
      style: GoogleFonts.orbitron(
          fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.bold),
    ),
    Container(
      height: 200,
      width: 150,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/foto/Electro_proddev.png"))),
    )
  ]),
  Container(
    decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/foto/electro2.png"))),
  ),
  Container(
    decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/foto/electro3.png"))),
  ),
  Container(
    decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/foto/electro4.png"))),
  ),
  ListView(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Text(
          "In this project i tried to make some device that can be helped on daily needed like make the mini Ups for the router and ip cam that created using lithium cell , power regulator , Ic charging  , Dc adapter , fuse and other component ,and i sell it online for the ups. I make some Internet of Things devices too like smart doorlock for my self , make A temperature and humidiy sensor that can be connected to Homekit(we know that its hard to bypass some apple software right? rather than open source google, hehehehe :D), and last i make some lantern that powered by solar energy",
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

class _projElectroState extends State<projElectro>
    with SingleTickerProviderStateMixin {
  late final TabController controller;
  final int _index = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(
        length: projectElectro.length, initialIndex: _index, vsync: this);
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
        children: projectElectro,
      ),
      Positioned(
          bottom: 20,
          child: TabPageSelector(
            controller: controller,
          ))
    ]);
  }
}
