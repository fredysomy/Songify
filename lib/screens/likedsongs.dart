import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:songify/helper/like_songs_helper.dart';
import 'package:songify/helper/playlisthelper.dart';
import 'package:songify/models/likesongs.dart';
import 'package:songify/screens/album_playlist.dart';
import 'package:songify/screens/player.dart';

class LikedSongs extends StatefulWidget {
  @override
  _LikedSongsState createState() => _LikedSongsState();
}

class _LikedSongsState extends State<LikedSongs> {
  bool liked_loaded = false;
  Box<LikeSongs>? songss;
  List? ids;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLiked();
  }

  Future getLiked() async {
    getLikedSongs().then((value) => {
          setState(() {
            songss = value;
            ids = songss!.keys.toList();
            liked_loaded = true;
          })
        });
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                    onPressed: () => {
                          {Navigator.pop(context)}
                        },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(8),
                      backgroundColor: const Color.fromARGB(255, 48, 49, 49),
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: const Icon(
                      Icons.keyboard_arrow_left_outlined,
                      color: Colors.white,
                      size: 25,
                    )),
                Container(
                  width: 300,
                  child: Text(
                    "Liked Songs",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            decoration: TextDecoration.none)),
                  ),
                ),
              ],
            ),
            ConstrainedBox(
                constraints: const BoxConstraints(
                    maxHeight: 500, minHeight: 300, maxWidth: double.infinity),
                child: (liked_loaded == false)
                    ? const Text(
                        "Not",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      )
                    : ListView.builder(
                        itemCount: songss!.values.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(7),
                            margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color.fromARGB(255, 66, 66, 66)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        songss!
                                            .get(ids?[index])!
                                            .image
                                            .toString(),
                                        height: 40,
                                        scale: 1,
                                        errorBuilder: (BuildContext context,
                                            Object exception,
                                            StackTrace? stackTrace) {
                                          return const Text('😢');
                                        },
                                      ),
                                    ),
                                    const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(5, 0, 5, 0)),
                                    Column(
                                      children: [
                                        Container(
                                          width: 230,
                                          child: Text(
                                              songss!
                                                  .get(ids?[index])!
                                                  .title
                                                  .toString(),
                                              maxLines: 1,
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 20,
                                                      decoration:
                                                          TextDecoration.none,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: Colors.white))),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                  width: 70,
                                  child: ElevatedButton(
                                    onPressed: () => {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Player(
                                                  fromWhere: "search",
                                                  id: songss!
                                                      .get(ids?[index])!
                                                      .id
                                                      .toString(),
                                                  url: songss!
                                                      .get(ids?[index])!
                                                      .url
                                                      .toString(),
                                                  title: songss!
                                                      .get(ids?[index])!
                                                      .title
                                                      .toString(),
                                                  image: songss!
                                                      .get(ids?[index])!
                                                      .image
                                                      .toString())))
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      padding: const EdgeInsets.all(10),
                                      backgroundColor:
                                          const Color.fromARGB(255, 48, 49, 49),
                                      foregroundColor: const Color.fromARGB(
                                          255, 255, 255, 255),
                                    ),
                                    child: const Icon(
                                      Icons.play_arrow_rounded,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        })),
          ],
        ),
      ),
    ));
  }
}
