import 'package:hive/hive.dart';

part 'playlistadd.g.dart';

@HiveType(typeId: 1)
class PlaylistAdd {
  @HiveField(0)
  final String? type;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? image;
  @HiveField(3)
  final String? id;

  PlaylistAdd({this.type, this.title, this.image, this.id});
}
