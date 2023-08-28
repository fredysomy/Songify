import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:http/http.dart' as http;
import 'package:songify/main.dart';
import 'package:songify/models/song.dart';
import 'package:songify/models/recomended.dart';
import 'package:provider/provider.dart';
import 'package:songify/provider/audioprovider.dart';
import 'package:songify/screens/home.dart';

class Player extends StatefulWidget {
  Player(
      {Key? key,
      this.audio,
      required this.fromWhere,
      this.id,
      this.url,
      this.title,
      this.image});
  final AudioPlayer? audio;
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
  bool reco_loaded = false;
  Song? song;
  RecomendedSongs? recomended;
  var duration = ''.obs;
  var position = ''.obs;
  var max = 0.0.obs;
  var value = 0.0.obs;
  var isPlaying = true.obs;
  @override
  initState() {
    super.initState();
    if (widget.fromWhere == "search" || widget.fromWhere == "playlist") {
      getSong();
      getRecomendedSongs();
    } else {
      getAldreadyPlayingSong();
      loaded = true;
      getRecomendedSongs();
    }
  }

  @override
  Future<void> startSong() async {
    await Provider.of<AppStateStore>(context, listen: false)
        .audioPlayer
        .setAudioSource(
            AudioSource.uri(
                Uri.parse(song!.data![0].downloadUrl![4].link.toString()),
                tag: MediaItem(
                  id: widget.id!,
                  title: widget.title!,
                  artist: widget.image!.replaceAll("50x50", "500x500"),
                )),
            preload: true);
    await Provider.of<AppStateStore>(context, listen: false).audioPlayer.play();
    listenDuration();
    listenPosition();
  }

  Future<void> getAldreadyPlayingSong() async {
    listenDuration();
    listenPosition();
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

  Future getRecomendedSongs() async {
    final response = await http.get(Uri.parse(
        'https://www.jiosaavn.com/api.php?__call=reco.getreco&api_version=4&_format=json&_marker=0&ctx=wap6dot0&pid=${widget.id}'));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        reco_loaded = true;
        recomended = RecomendedSongs.fromJson(data);
      });
    } else {
      setState(() {
        reco_loaded = false;
        recomended = RecomendedSongs.fromJson(data);
      });
    }
  }

  void listenDuration() {
    Provider.of<AppStateStore>(context, listen: false)
        .audioPlayer
        .durationStream
        .listen((d) {
      if (d == null) {
      } else {
        duration.value = d.toString().split('.')[0];
        max.value = d.inSeconds.toDouble();
      }
    });
  }

  void changeDurationtoSeconds(int seconds) {
    Duration duration = Duration(seconds: seconds);
    Provider.of<AppStateStore>(context, listen: false)
        .audioPlayer
        .seek(duration);
  }

  void listenPosition() {
    Provider.of<AppStateStore>(context, listen: false)
        .audioPlayer
        .positionStream
        .listen((p) {
      position.value = p.toString().split('.')[0];
      value.value = p.inSeconds.toDouble();
    });
  }

  void listenToEvent() {
    Provider.of<AppStateStore>(context, listen: false)
        .audioPlayer
        .playerStateStream
        .listen(
      (event) {
        if (event.playing) {
          isPlaying.value = true;
        } else {
          isPlaying.value = false;
        }
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  child: loaded == true
                      ? Column(
                          children: [
                            Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: ElevatedButton(
                                    onPressed: () => {
                                          if (widget.fromWhere == "playlist")
                                            {Navigator.pop(context)}
                                          else
                                            {
                                              Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              HomePage()),
                                                      (Route<dynamic> route) =>
                                                          false)
                                            }
                                        },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      padding: const EdgeInsets.all(8),
                                      backgroundColor:
                                          const Color.fromARGB(255, 48, 49, 49),
                                      foregroundColor: const Color.fromARGB(
                                          255, 255, 255, 255),
                                    ),
                                    child: const Icon(
                                      Icons.keyboard_arrow_left_outlined,
                                      color: Colors.white,
                                      size: 25,
                                    ))),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 50, 0, 50),
                              child: Center(
                                  child: Image.network(
                                Provider.of<AppStateStore>(context,
                                        listen: false)
                                    .audioPlayer
                                    .sequenceState!
                                    .currentSource!
                                    .tag!
                                    .artist
                                    .toString()
                                    .replaceAll("50x50", "500x500"),
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return const Text('😢');
                                },
                                height: 300,
                                scale: 1,
                              )),
                            ),
                            Container(
                              width: 300,
                              child: Text(
                                Provider.of<AppStateStore>(context,
                                        listen: false)
                                    .audioPlayer
                                    .sequenceState!
                                    .currentSource!
                                    .tag!
                                    .title
                                    .toString()
                                    .replaceAll("&amp;", "&")
                                    .replaceAll("&#039;", "'")
                                    .replaceAll("&quot;", "\""),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        decoration: TextDecoration.none)),
                              ),
                            ),
                            Obx(
                              () => Container(
                                padding: const EdgeInsets.all(0),
                                margin: const EdgeInsets.all(10),
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 1,
                                child: Slider(
                                  thumbColor: Colors.blueGrey.shade400,
                                  activeColor: Colors.blueGrey.shade400,
                                  inactiveColor: Colors.blueGrey.shade900,
                                  min: const Duration(microseconds: 0)
                                      .inSeconds
                                      .toDouble(),
                                  value: value.value,
                                  max: max.value,
                                  onChanged: (value) {
                                    changeDurationtoSeconds(value.toInt());
                                    value = value;
                                  },
                                ),
                              ),
                            ),
                            Obx(
                              () => Container(
                                margin: const EdgeInsets.all(5),
                                width: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  color: Colors.white,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    if (isPlaying.value == true) {
                                      Provider.of<AppStateStore>(context,
                                              listen: false)
                                          .audioPlayer
                                          .pause();
                                      isPlaying.value = false;
                                    } else {
                                      Provider.of<AppStateStore>(context,
                                              listen: false)
                                          .audioPlayer
                                          .play();
                                      isPlaying.value = true;
                                    }
                                  },
                                  icon: Icon(
                                    isPlaying.value == true
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    color: Colors.blueGrey.shade900,
                                    size: 34,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : const Center(
                          child: Text(
                            "Loading",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.fromLTRB(15, 50, 0, 20),
                child: Text(
                  "Recomended Songs",
                  style: GoogleFonts.poppins(
                      textStyle:
                          const TextStyle(fontSize: 25, color: Colors.white)),
                ),
              ),
              ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxHeight: 500, minHeight: 300),
                  child: (reco_loaded == false)
                      ? const Text(
                          "Not",
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        )
                      : ListView.builder(
                          itemCount: recomended!.songslist!.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(7),
                              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color.fromARGB(255, 66, 66, 66)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          recomended!.songslist![index].image
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
                                                recomended!
                                                    .songslist![index].title
                                                    .toString(),
                                                maxLines: 1,
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        fontSize: 20,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        color: Colors.white))),
                                          ),
                                          Container(
                                            width: 230,
                                            child: Text(
                                                recomended!
                                                    .songslist![index].subtitle
                                                    .toString(),
                                                maxLines: 1,
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        fontSize: 10,
                                                        overflow: TextOverflow
                                                            .ellipsis,
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
                                                    audio: widget.audio,
                                                    fromWhere: "search",
                                                    id: recomended!
                                                        .songslist![index].id
                                                        .toString(),
                                                    url: recomended!
                                                        .songslist![index]
                                                        .permaUrl
                                                        .toString(),
                                                    title: recomended!
                                                        .songslist![index].title
                                                        .toString(),
                                                    image: recomended!
                                                        .songslist![index].image
                                                        .toString())))
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: const CircleBorder(),
                                        padding: const EdgeInsets.all(10),
                                        backgroundColor: const Color.fromARGB(
                                            255, 48, 49, 49),
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
      ),
    );
  }
}
