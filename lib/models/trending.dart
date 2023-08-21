class Trending {
  final List<NewTrending>? newTrending;
  const Trending({this.newTrending});
  Trending copyWith({List<NewTrending>? newTrending}) {
    return Trending(newTrending: newTrending ?? this.newTrending);
  }

  Map<String, Object?> toJson() {
    return {
      'new_trending': newTrending
          ?.map<Map<String, dynamic>>((data) => data.toJson())
          .toList()
    };
  }

  static Trending fromJson(Map<String, dynamic> json) {
    return Trending(
        newTrending: json['new_trending'] == null
            ? null
            : (json['new_trending'])
                .map<NewTrending>((data) =>
                    NewTrending.fromJson(data as Map<String, Object?>))
                .toList());
  }

  @override
  String toString() {
    return '''Trending(
                newTrending:${newTrending.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Trending &&
        other.runtimeType == runtimeType &&
        other.newTrending == newTrending;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, newTrending);
  }
}

class NewTrending {
  final String? id;
  final String? title;
  final String? subtitle;
  final String? headerDesc;
  final String? type;
  final String? permaUrl;
  final String? image;
  final String? language;
  final String? year;
  final String? playCount;
  final String? explicitContent;
  final String? listCount;
  final String? listType;
  final String? list;
  final MoreInfo? moreInfo;
  final dynamic modules;
  const NewTrending(
      {this.id,
      this.title,
      this.subtitle,
      this.headerDesc,
      this.type,
      this.permaUrl,
      this.image,
      this.language,
      this.year,
      this.playCount,
      this.explicitContent,
      this.listCount,
      this.listType,
      this.list,
      this.moreInfo,
      this.modules});
  NewTrending copyWith(
      {String? id,
      String? title,
      String? subtitle,
      String? headerDesc,
      String? type,
      String? permaUrl,
      String? image,
      String? language,
      String? year,
      String? playCount,
      String? explicitContent,
      String? listCount,
      String? listType,
      String? list,
      MoreInfo? moreInfo,
      dynamic modules}) {
    return NewTrending(
        id: id ?? this.id,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        headerDesc: headerDesc ?? this.headerDesc,
        type: type ?? this.type,
        permaUrl: permaUrl ?? this.permaUrl,
        image: image ?? this.image,
        language: language ?? this.language,
        year: year ?? this.year,
        playCount: playCount ?? this.playCount,
        explicitContent: explicitContent ?? this.explicitContent,
        listCount: listCount ?? this.listCount,
        listType: listType ?? this.listType,
        list: list ?? this.list,
        moreInfo: moreInfo ?? this.moreInfo,
        modules: modules ?? this.modules);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'header_desc': headerDesc,
      'type': type,
      'perma_url': permaUrl,
      'image': image,
      'language': language,
      'year': year,
      'play_count': playCount,
      'explicit_content': explicitContent,
      'list_count': listCount,
      'list_type': listType,
      'list': list,
      'more_info': moreInfo?.toJson(),
      'modules': modules
    };
  }

  static NewTrending fromJson(Map<String, Object?> json) {
    return NewTrending(
        id: json['id'] == null ? null : json['id'] as String,
        title: json['title'] == null
            ? null
            : json['title']
                .toString()
                .replaceAll("&amp;", "&")
                .replaceAll("&#039;", "'")
                .replaceAll("&quot;", "\"") as String,
        subtitle: json['subtitle'] == null ? null : json['subtitle'] as String,
        headerDesc:
            json['header_desc'] == null ? null : json['header_desc'] as String,
        type: json['type'] == null ? null : json['type'] as String,
        permaUrl:
            json['perma_url'] == null ? null : json['perma_url'] as String,
        image: json['image'] == null ? null : json['image'] as String,
        language: json['language'] == null ? null : json['language'] as String,
        year: json['year'] == null ? null : json['year'] as String,
        playCount:
            json['play_count'] == null ? null : json['play_count'] as String,
        explicitContent: json['explicit_content'] == null
            ? null
            : json['explicit_content'] as String,
        listCount:
            json['list_count'] == null ? null : json['list_count'] as String,
        listType:
            json['list_type'] == null ? null : json['list_type'] as String,
        list: json['list'] == null ? null : json['list'] as String,
        moreInfo: json['more_info'] == null
            ? null
            : MoreInfo.fromJson(json['more_info'] as Map<String, Object?>),
        modules: json['modules'] as dynamic);
  }

  @override
  String toString() {
    return '''NewTrending(
                id:$id,
title:$title,
subtitle:$subtitle,
headerDesc:$headerDesc,
type:$type,
permaUrl:$permaUrl,
image:$image,
language:$language,
year:$year,
playCount:$playCount,
explicitContent:$explicitContent,
listCount:$listCount,
listType:$listType,
list:$list,
moreInfo:${moreInfo.toString()},
modules:$modules
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is NewTrending &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.headerDesc == headerDesc &&
        other.type == type &&
        other.permaUrl == permaUrl &&
        other.image == image &&
        other.language == language &&
        other.year == year &&
        other.playCount == playCount &&
        other.explicitContent == explicitContent &&
        other.listCount == listCount &&
        other.listType == listType &&
        other.list == list &&
        other.moreInfo == moreInfo &&
        other.modules == modules;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        title,
        subtitle,
        headerDesc,
        type,
        permaUrl,
        image,
        language,
        year,
        playCount,
        explicitContent,
        listCount,
        listType,
        list,
        moreInfo,
        modules);
  }
}

class MoreInfo {
  final String? releaseDate;
  final String? songCount;
  final ArtistMap? artistMap;
  const MoreInfo({this.releaseDate, this.songCount, this.artistMap});
  MoreInfo copyWith(
      {String? releaseDate, String? songCount, ArtistMap? artistMap}) {
    return MoreInfo(
        releaseDate: releaseDate ?? this.releaseDate,
        songCount: songCount ?? this.songCount,
        artistMap: artistMap ?? this.artistMap);
  }

  Map<String, Object?> toJson() {
    return {
      'release_date': releaseDate,
      'song_count': songCount,
      'artistMap': artistMap?.toJson()
    };
  }

  static MoreInfo fromJson(Map<String, Object?> json) {
    return MoreInfo(
        releaseDate: json['release_date'] == null
            ? null
            : json['release_date'] as String,
        songCount:
            json['song_count'] == null ? null : json['song_count'] as String,
        artistMap: json['artistMap'] == null
            ? null
            : ArtistMap.fromJson(json['artistMap'] as Map<String, Object?>));
  }

  @override
  String toString() {
    return '''MoreInfo(
                releaseDate:$releaseDate,
songCount:$songCount,
artistMap:${artistMap.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is MoreInfo &&
        other.runtimeType == runtimeType &&
        other.releaseDate == releaseDate &&
        other.songCount == songCount &&
        other.artistMap == artistMap;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, releaseDate, songCount, artistMap);
  }
}

class ArtistMap {
  final List<dynamic>? primaryArtists;
  final List<dynamic>? featuredArtists;
  final List<Artists>? artists;
  const ArtistMap({this.primaryArtists, this.featuredArtists, this.artists});
  ArtistMap copyWith(
      {List<dynamic>? primaryArtists,
      List<dynamic>? featuredArtists,
      List<Artists>? artists}) {
    return ArtistMap(
        primaryArtists: primaryArtists ?? this.primaryArtists,
        featuredArtists: featuredArtists ?? this.featuredArtists,
        artists: artists ?? this.artists);
  }

  Map<String, Object?> toJson() {
    return {
      'primary_artists': primaryArtists,
      'featured_artists': featuredArtists,
      'artists':
          artists?.map<Map<String, dynamic>>((data) => data.toJson()).toList()
    };
  }

  static ArtistMap fromJson(Map<String, Object?> json) {
    return ArtistMap(
        primaryArtists: json['primary_artists'] == null
            ? null
            : json['primary_artists'] as List<dynamic>,
        featuredArtists: json['featured_artists'] == null
            ? null
            : json['featured_artists'] as List<dynamic>,
        artists: json['artists'] == null
            ? null
            : (json['artists'] as List)
                .map<Artists>(
                    (data) => Artists.fromJson(data as Map<String, Object?>))
                .toList());
  }

  @override
  String toString() {
    return '''ArtistMap(
                primaryArtists:$primaryArtists,
featuredArtists:$featuredArtists,
artists:${artists.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is ArtistMap &&
        other.runtimeType == runtimeType &&
        other.primaryArtists == primaryArtists &&
        other.featuredArtists == featuredArtists &&
        other.artists == artists;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, primaryArtists, featuredArtists, artists);
  }
}

class Artists {
  final String? id;
  final String? name;
  final String? role;
  final String? image;
  final String? type;
  final String? permaUrl;
  const Artists(
      {this.id, this.name, this.role, this.image, this.type, this.permaUrl});
  Artists copyWith(
      {String? id,
      String? name,
      String? role,
      String? image,
      String? type,
      String? permaUrl}) {
    return Artists(
        id: id ?? this.id,
        name: name ?? this.name,
        role: role ?? this.role,
        image: image ?? this.image,
        type: type ?? this.type,
        permaUrl: permaUrl ?? this.permaUrl);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'image': image,
      'type': type,
      'perma_url': permaUrl
    };
  }

  static Artists fromJson(Map<String, Object?> json) {
    return Artists(
        id: json['id'] == null ? null : json['id'] as String,
        name: json['name'] == null ? null : json['name'] as String,
        role: json['role'] == null ? null : json['role'] as String,
        image: json['image'] == null ? null : json['image'] as String,
        type: json['type'] == null ? null : json['type'] as String,
        permaUrl:
            json['perma_url'] == null ? null : json['perma_url'] as String);
  }

  @override
  String toString() {
    return '''Artists(
                id:$id,
name:$name,
role:$role,
image:$image,
type:$type,
permaUrl:$permaUrl
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Artists &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.name == name &&
        other.role == role &&
        other.image == image &&
        other.type == type &&
        other.permaUrl == permaUrl;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, role, image, type, permaUrl);
  }
}
