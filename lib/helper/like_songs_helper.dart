import 'package:hive/hive.dart';

import 'dart:convert';
import 'package:songify/models/likesongs.dart';

Future<bool> likeThisSong(LikeSongs likedsongsdeets) async {
  var box = await Hive.openBox<LikeSongs>('liked');
  Box<LikeSongs> tasksBox;
  tasksBox = Hive.box('liked');
  tasksBox.add(likedsongsdeets);
  return true;
}

Future<Box<LikeSongs>> getLikedSongs() async {
  var box = await Hive.openBox<LikeSongs>('liked');
  Box<LikeSongs> tasksBox;
  tasksBox = Hive.box('liked');
  return tasksBox;
}

Future<bool> checkIfLiked(String id) async {
  var box = await Hive.openBox<LikeSongs>('liked');
  Box<LikeSongs> tasksBox;
  bool initvalue = false;
  tasksBox = Hive.box('liked');
  tasksBox.toMap().forEach((key, value) {
    if (id == value.id) {
      initvalue = true;
    }
  });
  return initvalue;
}

Future<bool> removeSaved(String id) async {
  var box = await Hive.openBox<LikeSongs>('liked');
  Box<LikeSongs> tasksBox;
  int? initvalue;
  tasksBox = Hive.box('liked');
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
