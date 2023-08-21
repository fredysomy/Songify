import 'package:songify/models/playlist.dart';
import 'package:songify/models/trending.dart';

class HomeWrap {
  late final Playlists playlists;
  late final Trending trending;

  HomeWrap({required this.playlists, required this.trending});

  HomeWrap.fromJson(json) {
    playlists = Playlists.fromJson(json);
    trending = Trending.fromJson(json);
  }
}
