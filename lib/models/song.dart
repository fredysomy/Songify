class Song {
  String? status;
  Null? message;
  List<Data>? data;

  Song({this.status, this.message, this.data});

  Song.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? type;
  Album? album;
  String? year;
  String? releaseDate;
  String? duration;
  String? label;
  String? primaryArtists;
  String? primaryArtistsId;
  String? featuredArtists;
  String? featuredArtistsId;
  int? explicitContent;
  int? playCount;
  String? language;
  String? hasLyrics;
  String? url;
  String? copyright;
  List<Media>? media;
  List<DownloadUrl>? downloadUrl;

  Data(
      {this.id,
      this.name,
      this.type,
      this.album,
      this.year,
      this.releaseDate,
      this.duration,
      this.label,
      this.primaryArtists,
      this.primaryArtistsId,
      this.featuredArtists,
      this.featuredArtistsId,
      this.explicitContent,
      this.playCount,
      this.language,
      this.hasLyrics,
      this.url,
      this.copyright,
      this.media,
      this.downloadUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    album = json['album'] != null ? new Album.fromJson(json['album']) : null;
    year = json['year'];
    releaseDate = json['releaseDate'];
    duration = json['duration'];
    label = json['label'];
    primaryArtists = json['primaryArtists'];
    primaryArtistsId = json['primaryArtistsId'];
    featuredArtists = json['featuredArtists'];
    featuredArtistsId = json['featuredArtistsId'];
    explicitContent = json['explicitContent'];
    playCount = json['playCount'];
    language = json['language'];
    hasLyrics = json['hasLyrics'];
    url = json['url'];
    copyright = json['copyright'];
    if (json['downloadUrl'] != null) {
      downloadUrl = <DownloadUrl>[];
      json['downloadUrl'].forEach((v) {
        downloadUrl!.add(new DownloadUrl.fromJson(v));
      });
    }
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    if (this.album != null) {
      data['album'] = this.album!.toJson();
    }
    data['year'] = this.year;
    data['releaseDate'] = this.releaseDate;
    data['duration'] = this.duration;
    data['label'] = this.label;
    data['primaryArtists'] = this.primaryArtists;
    data['primaryArtistsId'] = this.primaryArtistsId;
    data['featuredArtists'] = this.featuredArtists;
    data['featuredArtistsId'] = this.featuredArtistsId;
    data['explicitContent'] = this.explicitContent;
    data['playCount'] = this.playCount;
    data['language'] = this.language;
    data['hasLyrics'] = this.hasLyrics;
    data['url'] = this.url;
    data['copyright'] = this.copyright;
    if (this.downloadUrl != null) {
      data['downloadUrl'] = this.downloadUrl!.map((v) => v.toJson()).toList();
    }
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Album {
  String? id;
  String? name;
  String? url;

  Album({this.id, this.name, this.url});

  Album.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class DownloadUrl {
  String? quality;
  String? link;

  DownloadUrl({this.quality, this.link});

  DownloadUrl.fromJson(Map<String, dynamic> json) {
    quality = json['quality'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quality'] = this.quality;
    data['link'] = this.link;
    return data;
  }
}

class Media {
  String? quality;
  String? link;

  Media({this.quality, this.link});

  Media.fromJson(Map<String, dynamic> json) {
    quality = json['quality'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quality'] = this.quality;
    data['link'] = this.link;
    return data;
  }
}
