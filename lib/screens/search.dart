import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Searchpage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<Searchpage> {
  String _search = '';
  final TextEditingController _searchController = TextEditingController();
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
          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 7.0),
          // Use a Material design search bar
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: 'What do you want to listen to?',
              focusColor: Colors.amber,

              hintStyle:
                  GoogleFonts.poppins(textStyle: TextStyle(fontSize: 18)),
              // Add a clear button to the search bar
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.clear,
                  color: const Color.fromARGB(255, 46, 46, 46),
                ),
                onPressed: () => _searchController.clear(),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: const Color.fromARGB(255, 53, 52, 52)),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: const Color.fromARGB(255, 58, 58, 58)),
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: const Color.fromARGB(255, 46, 46, 46),
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
        )
      ],
    );
  }
}
