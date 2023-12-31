import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:songify/models/likesongs.dart';
import 'package:songify/screens/home.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:just_audio/just_audio.dart';
import 'package:songify/screens/playlists.dart';
import 'package:songify/screens/search.dart';
import 'package:provider/provider.dart';
import 'package:songify/models/playlistadd.dart';
import 'package:songify/provider/audioprovider.dart';

Future<void> main() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  await Hive.initFlutter();
  Hive
    ..registerAdapter(PlaylistAddAdapter())
    ..registerAdapter(LikeSongsAdapter());
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AppStateStore())],
      child: MyApp()));
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
  void initState() {
    super.initState();

    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarDividerColor: Colors.black,
        ),
      );
    }
  }

  @override
  int selectedIndex = 0;
  late String cookies;

  final audioPlayer = AudioPlayer();
  final pages = [
    Home(
      audioPlayer: AudioPlayer(),
    ),
    Searchpage(audio: AudioPlayer()),
    Playlists(),
    Playlists()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 23, 23),
      body: pages[selectedIndex],
      bottomNavigationBar: Stack(children: [
        Container(
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: const Color.fromARGB(255, 255, 255, 255)!,
                hoverColor: const Color.fromARGB(255, 255, 255, 255),
                gap: 8,
                activeColor: const Color.fromARGB(255, 255, 255, 255),
                iconSize: 30,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                  GButton(
                    icon: Icons.download_for_offline_outlined,
                    text: "Downloaded",
                  )
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
      ]),
    );
  }
}
