import 'package:songify/models/charts.dart';
import 'package:songify/models/playlist.dart';
import 'package:songify/models/trending.dart';

class HomeWrap {
  late final Playlists playlists;
  late final Trending trending;
  late final ChartsList chartlist;

  HomeWrap(
      {required this.playlists,
      required this.trending,
      required this.chartlist});

  HomeWrap.fromJson(json) {
    playlists = Playlists.fromJson(json);
    trending = Trending.fromJson(json);
    chartlist = ChartsList.fromJson(json);
  }
}
