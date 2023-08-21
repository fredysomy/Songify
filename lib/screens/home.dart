import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:songify/api/playlists.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:songify/models/trending.dart';
import 'package:songify/models/home_wrapper.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<HomeWrap> getTrending() async {
    //create your own api
    print("dsd");
    final response = await http.get(Uri.parse(
        'https://www.jiosaavn.com/api.php?__call=webapi.getLaunchData&api_version=4&_format=json&_marker=0&ctx=wap6dot0'));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return HomeWrap.fromJson(data);
    } else {
      return HomeWrap.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchAlbum();
    DateTime now = DateTime.now();
    var timeNow = int.parse(DateFormat('kk').format(now));
    var message = '';

    if (timeNow <= 12) {
      message = 'Good Morning';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      message = 'Good Afernoon';
    } else if ((timeNow > 16) && (timeNow < 20)) {
      message = 'Good Evening';
    } else {
      message = 'Good Night';
    }

    return Container(
      child: Column(children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(14, 60, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                message,
                style: GoogleFonts.poppins(
                    textStyle:
                        const TextStyle(fontSize: 30, color: Colors.white)),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => print("sdd"),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                      backgroundColor: const Color.fromARGB(255, 48, 49, 49),
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: const Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => print("sdd"),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                      backgroundColor: const Color.fromARGB(255, 48, 49, 49),
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: const Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.fromLTRB(15, 20, 0, 10),
          child: Text(
            "Now Trending",
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(fontSize: 25, color: Colors.white)),
          ),
        ),
        ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: double.infinity, maxHeight: 250, minHeight: 250),
            child: FutureBuilder(
                future: getTrending(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.trending.newTrending!.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        const Color.fromARGB(255, 56, 55, 55)),
                                height: 200,
                                width: 170,
                                margin: const EdgeInsets.fromLTRB(15, 5, 5, 0),
                                child: Column(children: [
                                  const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 20, 0, 0)),
                                  Image.network(
                                    snapshot.data!.trending.newTrending![index]
                                        .image
                                        .toString(),
                                    height: 130,
                                  ),
                                  const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 10, 0, 0)),
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(7, 0, 7, 0),
                                    child: Text(
                                      snapshot.data!.trending
                                          .newTrending![index].title
                                          .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        textStyle:
                                            const TextStyle(fontSize: 20),
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ]),
                              )
                            ],
                          );
                        });
                  } else {
                    return const Text("loading");
                  }
                })),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
          child: Text(
            "Playlists for you",
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(fontSize: 25, color: Colors.white)),
          ),
        ),
        ConstrainedBox(
            constraints:
                BoxConstraints(maxWidth: double.infinity, maxHeight: 250),
            child: FutureBuilder(
                future: getTrending(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount:
                            snapshot.data!.playlists.topPlaylists!.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        const Color.fromARGB(255, 56, 55, 55)),
                                height: 200,
                                width: 170,
                                margin: const EdgeInsets.fromLTRB(15, 5, 5, 5),
                                child: Column(children: [
                                  const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 20, 0, 0)),
                                  Image.network(
                                    snapshot.data!.playlists
                                        .topPlaylists![index].image
                                        .toString(),
                                    height: 130,
                                  ),
                                  const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 10, 0, 0)),
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(7, 0, 7, 0),
                                    child: Text(
                                      snapshot.data!.playlists
                                          .topPlaylists![index].title
                                          .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        textStyle:
                                            const TextStyle(fontSize: 20),
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ]),
                              )
                            ],
                          );
                        });
                  } else {
                    return const Text("loading");
                  }
                }))
      ]),
    );
  }
}