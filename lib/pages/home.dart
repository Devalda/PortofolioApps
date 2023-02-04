import 'package:devaldaporto/pages/mymedia.dart';
import 'package:devaldaporto/pages/myproject.dart';
import 'package:devaldaporto/pages/profile.dart';
import 'package:devaldaporto/pages/quotegen.dart';
import 'package:flutter/material.dart';

import 'mymedia.dart';

const TextStyle _textStyle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
    fontStyle: FontStyle.italic);

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 1;
  final pageSelected = [QuoteGen(), Profile(), MyProject(), MyMedia()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pageSelected[_currentIndex],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.teal.withOpacity(0.5),
        ),
        child: NavigationBar(
          height: 60,
          backgroundColor: Colors.white,
          animationDuration: const Duration(seconds: 1),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: _currentIndex,
          onDestinationSelected: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(
                Icons.psychology,
                size: 30,
              ),
              icon: Icon(
                Icons.psychology_outlined,
                size: 40,
              ),
              label: 'quote',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.person,
                size: 30,
              ),
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: 'profile',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.account_tree,
                size: 30,
              ),
              icon: Icon(
                Icons.account_tree_outlined,
                size: 40,
              ),
              label: 'project',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.add_link,
                size: 30,
              ),
              icon: Icon(
                Icons.add_link_outlined,
                size: 40,
              ),
              label: 'connect',
            ),
          ],
        ),
      ),
    );
  }
}
