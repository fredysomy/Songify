class Search {
  Songs? songs;
  Playlists? playlists;
  Songs? topquery;

  Search({this.songs, this.playlists, this.topquery});

  Search.fromJson(Map<String, dynamic> json) {
    songs = json['songs'] != null ? new Songs.fromJson(json['songs']) : null;
    playlists = json['playlists'] != null
        ? new Playlists.fromJson(json['playlists'])
        : null;
    topquery =
        json['topquery'] != null ? new Songs.fromJson(json['topquery']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.songs != null) {
      data['songs'] = this.songs!.toJson();
    }
    if (this.playlists != null) {
      data['playlists'] = this.playlists!.toJson();
    }
    if (this.topquery != null) {
      data['topquery'] = this.topquery!.toJson();
    }
    return data;
  }
}

class Songs {
  List<Data>? data;
  int? position;

  Songs({this.data, this.position});

  Songs.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['position'] = this.position;
    return data;
  }
}

class Data {
  String? id;
  String? title;
  String? image;
  String? album;
  String? url;
  String? type;
  String? description;
  int? ctr;
  int? position;
  MoreInfo? moreInfo;

  Data(
      {this.id,
      this.title,
      this.image,
      this.album,
      this.url,
      this.type,
      this.description,
      this.ctr,
      this.position,
      this.moreInfo});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    album = json['album'];
    url = json['url'];
    type = json['type'];
    description = json['description'];
    ctr = json['ctr'];
    position = json['position'];
    moreInfo = json['more_info'] != null
        ? new MoreInfo.fromJson(json['more_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['album'] = this.album;
    data['url'] = this.url;
    data['type'] = this.type;
    data['description'] = this.description;
    data['ctr'] = this.ctr;
    data['position'] = this.position;
    if (this.moreInfo != null) {
      data['more_info'] = this.moreInfo!.toJson();
    }
    return data;
  }
}

class MoreInfo {
  String? primaryArtists;
  String? singers;
  Null? videoAvailable;
  bool? trillerAvailable;
  String? language;

  MoreInfo(
      {this.primaryArtists,
      this.singers,
      this.videoAvailable,
      this.trillerAvailable,
      this.language});

  MoreInfo.fromJson(Map<String, dynamic> json) {
    primaryArtists = json['primary_artists'];
    singers = json['singers'];
    videoAvailable = json['video_available'];
    trillerAvailable = json['triller_available'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['primary_artists'] = this.primaryArtists;
    data['singers'] = this.singers;
    data['video_available'] = this.videoAvailable;
    data['triller_available'] = this.trillerAvailable;
    data['language'] = this.language;
    return data;
  }
}

class Playlists {
  List<Data>? data;
  int? position;

  Playlists({this.data, this.position});

  Playlists.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v?.toJson()).toList();
    }
    data['position'] = this.position;
    return data;
  }
}
