import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

class AppStateStore with ChangeNotifier, DiagnosticableTreeMixin {
  AudioPlayer audioPlayer = AudioPlayer();
}
