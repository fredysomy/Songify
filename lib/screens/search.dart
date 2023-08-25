import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import "package:songify/models/search.dart";
import 'package:http/http.dart' as http;
import 'package:songify/screens/player.dart';

class Searchpage extends StatefulWidget {
  Searchpage({Key? key, required this.audio});
  final AudioPlayer audio;
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<Searchpage> {
  String _searchi = '';
  Search? search;
  final TextEditingController _searchController = TextEditingController();

  Future getTrending(String searchitem) async {
    //create your own api
    if (searchitem != "") {
      final response = await http.get(Uri.parse(
          'https://www.jiosaavn.com/api.php?__call=autocomplete.get&query=$searchitem&_format=json&_marker=0&ctx=wap6dot0'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        setState(() {
          search = Search.fromJson(data);
        });
      } else {
        setState(() {
          search = Search.fromJson(data) as Search;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(14, 60, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Search",
                style: GoogleFonts.poppins(
                    textStyle:
                        const TextStyle(fontSize: 30, color: Colors.white)),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => {},
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
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 7.0),
          // Use a Material design search bar
          child: TextField(
            controller: _searchController,
            onChanged: (value) => {getTrending(value)},
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: 'What do you want to listen to?',
              focusColor: Colors.amber,

              hintStyle:
                  GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 18)),
              // Add a clear button to the search bar
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: Color.fromARGB(255, 46, 46, 46),
                ),
                onPressed: () => _searchController.clear(),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 53, 52, 52)),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 58, 58, 58)),
                borderRadius: BorderRadius.circular(10),
              ),

              prefixIcon: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 46, 46, 46),
                  size: 35,
                ),
                onPressed: () {
                  // Perform the search here
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
          child: Text(
            "Songs",
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(fontSize: 25, color: Colors.white)),
          ),
        ),
        Expanded(
            child: (search?.songs == null)
                ? const Text(
                    "Not",
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  )
                : ListView.builder(
                    itemCount: search?.songs!.data?.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(7),
                        margin: const EdgeInsets.all(7),
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
                                    search!.songs!.data![index].image
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
                                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0)),
                                Column(
                                  children: [
                                    Container(
                                      width: 230,
                                      child: Text(
                                          search!.songs!.data![index].title
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
                                          search!.songs!.data![index].moreInfo!
                                              .singers
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
                                              audio: widget.audio,
                                              fromWhere: "search",
                                              id: search!.songs!.data![index].id
                                                  .toString(),
                                              url: search!
                                                  .songs!.data![index].url
                                                  .toString(),
                                              title: search!
                                                  .songs!.data![index].title
                                                  .toString(),
                                              image: search!
                                                  .songs!.data![index].image
                                                  .toString())))
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(10),
                                  backgroundColor:
                                      const Color.fromARGB(255, 48, 49, 49),
                                  foregroundColor:
                                      const Color.fromARGB(255, 255, 255, 255),
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
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
          child: Text(
            "Playlists",
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(fontSize: 25, color: Colors.white)),
          ),
        ),
        Expanded(
            child: (search?.playlists == null)
                ? const Text(
                    "Not",
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  )
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: search?.playlists!.data?.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(7),
                        margin: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color.fromARGB(255, 66, 66, 66)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  search!.playlists!.data![index].image
                                      .toString(),
                                  height: 40,
                                  scale: 1,
                                ),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0)),
                                Container(
                                  width: 230,
                                  child: Text(
                                      search!.playlists!.data![index].title
                                          .toString(),
                                      maxLines: 1,
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 20,
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.white))),
                                )
                              ],
                            ),
                            Container(
                              width: 70,
                              child: ElevatedButton(
                                onPressed: () => print("sdd"),
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(10),
                                  backgroundColor:
                                      const Color.fromARGB(255, 48, 49, 49),
                                  foregroundColor:
                                      const Color.fromARGB(255, 255, 255, 255),
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
                    }))
      ],
    );
  }
}
