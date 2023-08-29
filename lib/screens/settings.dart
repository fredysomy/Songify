import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class Settings extends StatefulWidget {
  Settings({Key? key});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void initState() {
    super.initState();
    loadFromPrefs();
  }

  late List<String>? selectedIndexes = [];

  Future<void> loadFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedIndexes = prefs.getStringList('prefs')!;
    });
    print(selectedIndexes);
  }

  saveToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(selectedIndexes);
    prefs.setStringList("prefs", selectedIndexes!);
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        body: Column(
          children: [
            Row(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: ElevatedButton(
                        onPressed: () => {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                  (Route<dynamic> route) => false)
                            },
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
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.fromLTRB(15, 20, 0, 10),
                  child: Text(
                    "Language Preferences",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 120, 230, 110),
                            decoration: TextDecoration.none)),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Column(
                children: [
                  Card(
                    color: Color.fromARGB(255, 68, 68, 68),
                    elevation: 2.0,
                    child: CheckboxListTile(
                      title: Text(
                        "English",
                        style: TextStyle(color: Colors.white),
                      ),
                      value: selectedIndexes!.contains('english'),
                      onChanged: (_) {
                        if (selectedIndexes!.contains('english')) {
                          setState(() {
                            selectedIndexes!.remove('english');
                          }); // unselect
                        } else {
                          setState(() {
                            selectedIndexes!.add('english');
                          }); // select
                        }
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  Card(
                    color: Color.fromARGB(255, 68, 68, 68),
                    elevation: 2.0,
                    child: CheckboxListTile(
                      title:
                          Text("Hindi", style: TextStyle(color: Colors.white)),
                      value: selectedIndexes!.contains('hindi'),
                      onChanged: (_) {
                        if (selectedIndexes!.contains('hindi')) {
                          setState(() {
                            selectedIndexes!.remove('hindi');
                          });
                          // unselect
                        } else {
                          setState(() {
                            selectedIndexes!.add('hindi'); // sel
                          });
                        }
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  Card(
                    color: Color.fromARGB(255, 68, 68, 68),
                    elevation: 2.0,
                    child: CheckboxListTile(
                      title:
                          Text("Tamil", style: TextStyle(color: Colors.white)),
                      value: selectedIndexes!.contains('tamil'),
                      onChanged: (_) {
                        if (selectedIndexes!.contains('tamil')) {
                          setState(() {
                            selectedIndexes!.remove('tamil');
                          });
                          // unselect
                        } else {
                          setState(() {
                            selectedIndexes!.add('tamil'); // sel
                          });
                        }
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  Card(
                    color: Color.fromARGB(255, 68, 68, 68),
                    elevation: 2.0,
                    child: CheckboxListTile(
                      title: Text("Punjabi",
                          style: TextStyle(color: Colors.white)),
                      value: selectedIndexes!.contains('punjabi'),
                      onChanged: (_) {
                        if (selectedIndexes!.contains('punjabi')) {
                          setState(() {
                            selectedIndexes!.remove('punjabi');
                          });
                          // unselect
                        } else {
                          setState(() {
                            selectedIndexes!.add('punjabi'); // sel
                          });
                        }
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => {saveToPrefs()},
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
