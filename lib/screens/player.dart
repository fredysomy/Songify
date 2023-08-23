import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:http/http.dart' as http;
import 'package:songify/models/song.dart';

class Player extends StatefulWidget {
  Player(
      {Key? key,
      required this.audio,
      required this.fromWhere,
      this.id,
      this.url,
      this.title,
      this.image});
  final AudioPlayer audio;
  final String fromWhere;
  final String? id;
  final String? url;
  final String? title;
  final String? image;

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  bool loaded = false;
  Song? song;
  @override
  initState() {
    super.initState();
    getSong();
  }

  @override
  Future<void> startSong() async {
    await widget.audio.setAudioSource(
        AudioSource.uri(
            Uri.parse(song!.data![0].downloadUrl![4].link.toString()),
            tag: MediaItem(
                id: widget.id!, title: widget.title!, artist: widget.image!)),
        preload: true);
    await widget.audio.play();
  }

  Future getSong() async {
    //create your own api

    final response =
        await http.get(Uri.parse('https://saavn.me/songs?link=${widget.url}'));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        loaded = true;
        song = Song.fromJson(data);
      });
      startSong();
    } else {
      setState(() {
        song = Song.fromJson(data);
        loaded = false;
      });
    }
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          width: double.infinity,
          child: loaded == true
              ? Column(
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: ElevatedButton(
                            onPressed: () => {Navigator.pop(context)},
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(8),
                              backgroundColor:
                                  const Color.fromARGB(255, 48, 49, 49),
                              foregroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                            ),
                            child: const Icon(
                              Icons.keyboard_arrow_left_outlined,
                              color: Colors.white,
                              size: 25,
                            ))),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 100, 0, 50),
                      child: Center(
                          child: Image.network(
                        widget.image!.replaceAll("50x50", "500x500"),
                        height: 300,
                        scale: 1,
                      )),
                    ),
                    Container(
                      child: Text(
                        widget.title!,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                decoration: TextDecoration.none)),
                      ),
                    )
                  ],
                )
              : Center(
                  child: Text(
                    "Loading",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
    );
  }
}
