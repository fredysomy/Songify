class Playlists {
  List<TopPlaylists>? topPlaylists;

  Playlists({this.topPlaylists});

  Playlists.fromJson(Map<String, dynamic> json) {
    if (json['top_playlists'] != null) {
      topPlaylists = <TopPlaylists>[];
      json['top_playlists'].forEach((v) {
        topPlaylists!.add(new TopPlaylists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.topPlaylists != null) {
      data['top_playlists'] =
          this.topPlaylists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TopPlaylists {
  String? id;
  String? title;
  String? subtitle;
  String? type;
  String? image;
  String? permaUrl;
  MoreInfo? moreInfo;
  String? explicitContent;
  bool? miniObj;

  TopPlaylists(
      {this.id,
      this.title,
      this.subtitle,
      this.type,
      this.image,
      this.permaUrl,
      this.moreInfo,
      this.explicitContent,
      this.miniObj});

  TopPlaylists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    type = json['type'];
    image = json['image'];
    permaUrl = json['perma_url'];
    moreInfo = json['more_info'] != null
        ? new MoreInfo.fromJson(json['more_info'])
        : null;
    explicitContent = json['explicit_content'];
    miniObj = json['mini_obj'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['type'] = this.type;
    data['image'] = this.image;
    data['perma_url'] = this.permaUrl;
    if (this.moreInfo != null) {
      data['more_info'] = this.moreInfo!.toJson();
    }
    data['explicit_content'] = this.explicitContent;
    data['mini_obj'] = this.miniObj;
    return data;
  }
}

class MoreInfo {
  String? songCount;
  String? firstname;
  String? followerCount;
  String? lastUpdated;
  String? uid;

  MoreInfo(
      {this.songCount,
      this.firstname,
      this.followerCount,
      this.lastUpdated,
      this.uid});

  MoreInfo.fromJson(Map<String, dynamic> json) {
    songCount = json['song_count'];
    firstname = json['firstname'];
    followerCount = json['follower_count'];
    lastUpdated = json['last_updated'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['song_count'] = this.songCount;
    data['firstname'] = this.firstname;
    data['follower_count'] = this.followerCount;
    data['last_updated'] = this.lastUpdated;
    data['uid'] = this.uid;
    return data;
  }
}
