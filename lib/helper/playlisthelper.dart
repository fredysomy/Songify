import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:songify/models/playlistadd.dart';

Future<bool> saveToPlaylist(PlaylistAdd playlistdeets) async {
  var box = await Hive.openBox<PlaylistAdd>('plays');
  Box<PlaylistAdd> tasksBox;
  tasksBox = Hive.box('plays');
  tasksBox.add(playlistdeets);
  return true;
}

Future<Box<PlaylistAdd>> getAll() async {
  var box = await Hive.openBox<PlaylistAdd>('plays');
  Box<PlaylistAdd> tasksBox;
  tasksBox = Hive.box('plays');
  return tasksBox;
}

Future<bool> checkIfSaved(String id) async {
  var box = await Hive.openBox<PlaylistAdd>('plays');
  Box<PlaylistAdd> tasksBox;
  bool initvalue = false;
  tasksBox = Hive.box('plays');
  tasksBox.toMap().forEach((key, value) {
    if (id == value.id) {
      initvalue = true;
    }
  });
  return initvalue;
}

Future<bool> removeSaved(String id) async {
  var box = await Hive.openBox<PlaylistAdd>('plays');
  Box<PlaylistAdd> tasksBox;
  int? initvalue;
  tasksBox = Hive.box('plays');
  tasksBox.toMap().forEach((key, value) {
    print(key);
    print(value.title);
    if (id == value.id) {
      initvalue = key;
    }
  });
  tasksBox.delete(initvalue!);
  return true;
}
