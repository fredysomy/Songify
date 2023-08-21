import 'package:flutter/material.dart';

import 'package:songify/screens/home.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:songify/screens/search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final pages = [Home(), Searchpage(), Home()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 23, 23),
      body: pages[selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 24, 23, 23),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Color.fromARGB(255, 24, 23, 23),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: const Color.fromARGB(255, 255, 255, 255)!,
              hoverColor: const Color.fromARGB(255, 255, 255, 255),
              gap: 8,
              activeColor: const Color.fromARGB(255, 255, 255, 255),
              iconSize: 30,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: const Color.fromARGB(255, 37, 37, 37),
              color: const Color.fromARGB(255, 255, 255, 255),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.playlist_play_outlined,
                  text: 'Playlists',
                ),
              ],
              selectedIndex: selectedIndex,
              onTabChange: (index) {
                print(index);
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
