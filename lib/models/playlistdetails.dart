class PlaylistDetails {
  String? status;
  Null? message;
  Data? data;

  PlaylistDetails({this.status, this.message, this.data});

  PlaylistDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? userId;
  String? name;
  String? followerCount;
  String? songCount;
  String? fanCount;
  String? username;
  String? firstname;
  String? lastname;
  String? shares;
  List<Images>? image;
  String? url;
  List<Songs>? songs;

  Data(
      {this.id,
      this.userId,
      this.name,
      this.followerCount,
      this.songCount,
      this.fanCount,
      this.username,
      this.firstname,
      this.lastname,
      this.shares,
      this.image,
      this.url,
      this.songs});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    name = json['name'];
    followerCount = json['followerCount'];
    songCount = json['songCount'];
    fanCount = json['fanCount'];
    username = json['username'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    shares = json['shares'];
    if (json['images'] != null) {
      image = <Images>[];
      json['image'].forEach((v) {
        image!.add(new Images.fromJson(v));
      });
    }
    url = json['url'];
    if (json['songs'] != null) {
      songs = <Songs>[];
      json['songs'].forEach((v) {
        songs!.add(new Songs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['followerCount'] = this.followerCount;
    data['songCount'] = this.songCount;
    data['fanCount'] = this.fanCount;
    data['username'] = this.username;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['shares'] = this.shares;
    if (this.image != null) {
      data['image'] = this.image!.map((v) => v.toJson()).toList();
    }
    data['url'] = this.url;
    if (this.songs != null) {
      data['songs'] = this.songs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? quality;
  String? link;

  Images({this.quality, this.link});

  Images.fromJson(Map<String, dynamic> json) {
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

class Songs {
  String? id;
  String? name;
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
  String? playCount;
  String? language;
  String? hasLyrics;
  String? url;
  String? copyright;
  List<Images>? image;

  Songs({
    this.id,
    this.name,
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
    this.image,
  });

  Songs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
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
    if (json['image'] != null) {
      image = <Images>[];
      json['image'].forEach((v) {
        image!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
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
    if (this.image != null) {
      data['image'] = this.image!.map((v) => v.toJson()).toList();
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
