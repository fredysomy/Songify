import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:songify/helper/playlisthelper.dart';
import 'package:songify/screens/album_playlist.dart';

class Playlists extends StatefulWidget {
  @override
  _PlaylistsState createState() => _PlaylistsState();
}

class _PlaylistsState extends State<Playlists> {
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
              child: Text(
                "Playlists",
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    textStyle:
                        const TextStyle(fontSize: 30, color: Colors.white)),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
              child: Text(
                "Saved Playlists",
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    textStyle:
                        const TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
            ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: double.infinity, maxHeight: 350, minHeight: 50),
                child: FutureBuilder(
                    future: getAll(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List ids = snapshot.data!.keys.toList();
                        return ListView.builder(
                            itemCount: snapshot.data?.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.all(7),
                                margin: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color:
                                        const Color.fromARGB(255, 66, 66, 66)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            snapshot.data!
                                                .get(ids[index])!
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
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                5, 0, 5, 0)),
                                        Column(
                                          children: [
                                            Container(
                                              width: 230,
                                              child: Text(
                                                  snapshot.data!
                                                      .get(ids[index])!
                                                      .title
                                                      .toString(),
                                                  maxLines: 1,
                                                  style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 20,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              color: Colors
                                                                  .white))),
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
                                                  builder: (context) =>
                                                      AlbumandPlaylist(
                                                        type: snapshot.data!
                                                            .get(ids[index])!
                                                            .type
                                                            .toString(),
                                                        image: snapshot.data!
                                                            .get(ids[index])!
                                                            .image
                                                            .toString(),
                                                        id: snapshot.data!
                                                            .get(ids[index])!
                                                            .id
                                                            .toString(),
                                                        title: snapshot.data!
                                                            .get(ids[index])!
                                                            .title
                                                            .toString(),
                                                        fromwhere: 'playlists',
                                                      )))
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
                            });
                      } else {
                        return Text(
                          "asdasd",
                          style: TextStyle(color: Colors.white),
                        );
                      }
                    })),
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
              child: Text(
                "Liked Songs",
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    textStyle:
                        const TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
