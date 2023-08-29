import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:songify/models/playlistadd.dart';
import 'package:songify/screens/player.dart';

import '../main.dart';
import 'package:songify/models/albumdetails.dart';
import 'package:songify/models/playlistdetails.dart';

import 'package:songify/helper/playlisthelper.dart';

import 'package:http/http.dart' as http;

class AlbumandPlaylist extends StatefulWidget {
  AlbumandPlaylist(
      {Key? key,
      required this.type,
      required this.image,
      required this.id,
      required this.title,
      required this.fromwhere});

  final String type;
  final String image;
  final String id;
  final String title;
  final String fromwhere;
  @override
  _AlbumandPlaylistState createState() => _AlbumandPlaylistState();
}

class _AlbumandPlaylistState extends State<AlbumandPlaylist> {
  bool loaded = false;
  var saveds = false.obs;
  PlaylistDetails? playlistdetails;
  AlbumDetails? albumdetails;
  void initState() {
    super.initState();

    if (widget.type == 'album') {
      getAlbumDetails();
      checkSaved();
    } else {
      getPlaylistDetails();
      checkSaved();
    }
  }

  Future getAlbumDetails() async {
    final response =
        await http.get(Uri.parse('https://saavn.me/albums?id=${widget.id}'));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        loaded = true;
        albumdetails = AlbumDetails.fromJson(data);
      });
    } else {
      setState(() {
        albumdetails = AlbumDetails.fromJson(data);
        loaded = false;
      });
    }
  }

  Future getPlaylistDetails() async {
    final response =
        await http.get(Uri.parse('https://saavn.me/playlists?id=${widget.id}'));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        loaded = true;
        playlistdetails = PlaylistDetails.fromJson(data);
      });
    } else {
      setState(() {
        playlistdetails = PlaylistDetails.fromJson(data);
        loaded = false;
      });
    }
  }

  Future checkSaved() async {
    checkIfSaved(widget.id).then((value) => {
          if (value == true)
            {
              setState(() {
                saveds.value = true;
              })
            }
          else
            {
              setState(() {
                saveds.value = false;
              })
            }
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 23, 23),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: ElevatedButton(
                    onPressed: () => {
                          if (widget.fromwhere == "playlists")
                            {Navigator.pop(context)}
                          else
                            {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                  (Route<dynamic> route) => false)
                            }
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
                    ))),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 50, 0, 50),
              child: Center(
                  child: Image.network(
                widget.image.toString(),
                height: 150,
                scale: 1,
              )),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              alignment: Alignment.center,
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                )),
              ),
            ),
            Container(
              child: Text(
                widget.type,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
            Obx(
              () => Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: ElevatedButton(
                      onPressed: () => {
                            saveds.value == false
                                ? saveToPlaylist(PlaylistAdd(
                                        type: widget.type,
                                        title: widget.title,
                                        image: widget.image,
                                        id: widget.id))
                                    .then((e) => {saveds.value = true})
                                : removeSaved(widget.id)
                                    .then((value) => saveds.value = false)
                          },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(8),
                        backgroundColor: const Color.fromARGB(255, 48, 49, 49),
                        foregroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Icon(
                        saveds.value == true
                            ? Icons.playlist_remove
                            : Icons.playlist_add,
                        color: Colors.white,
                        size: 25,
                      ))),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
            ConstrainedBox(
                constraints:
                    const BoxConstraints(maxHeight: 500, minHeight: 300),
                child: (loaded == false)
                    ? const Text(
                        "Not",
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      )
                    : ListView.builder(
                        itemCount: widget.type == 'album'
                            ? albumdetails!.data!.songs!.length
                            : playlistdetails!.data!.songs!.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(7),
                            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                                        widget.type == 'album'
                                            ? albumdetails!.data!.songs![index]
                                                .image![1].link
                                                .toString()
                                            : playlistdetails!.data!
                                                .songs![index].image![1].link
                                                .toString(),
                                        height: 30,
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
                                              widget.type == 'album'
                                                  ? albumdetails!
                                                      .data!.songs![index].name!
                                                      .toString()
                                                  : playlistdetails!
                                                      .data!.songs![index].name!
                                                      .toString(),
                                              maxLines: 1,
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 20,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: Colors.white))),
                                        ),
                                        Container(
                                          width: 230,
                                          child: Text(
                                              widget.type == 'album'
                                                  ? albumdetails!
                                                      .data!
                                                      .songs![index]
                                                      .primaryArtists!
                                                      .toString()
                                                  : playlistdetails!
                                                      .data!
                                                      .songs![index]
                                                      .primaryArtists!
                                                      .toString(),
                                              maxLines: 1,
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 10,
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
                                                  fromWhere: "playlist",
                                                  id: widget.type == 'album'
                                                      ? albumdetails!.data!
                                                          .songs![index].id!
                                                          .toString()
                                                      : playlistdetails!.data!
                                                          .songs![index].id!
                                                          .toString(),
                                                  url: widget.type == 'album'
                                                      ? albumdetails!.data!
                                                          .songs![index].url!
                                                          .toString()
                                                      : playlistdetails!.data!
                                                          .songs![index].url!
                                                          .toString(),
                                                  title: widget.type == 'album'
                                                      ? albumdetails!.data!
                                                          .songs![index].name!
                                                          .toString()
                                                      : playlistdetails!.data!.songs![index].name!.toString(),
                                                  image: widget.type == 'album' ? albumdetails!.data!.songs![index].image![2].link.toString() : playlistdetails!.data!.songs![index].image![2].link.toString())))
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
      )),
    );
  }
}
