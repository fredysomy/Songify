import 'package:hive/hive.dart';

part 'likesongs.g.dart';

@HiveType(typeId: 2)
class LikeSongs {
  @HiveField(0)
  final String? url;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? image;
  @HiveField(3)
  final String? id;

  LikeSongs({this.url, this.title, this.image, this.id});
}
