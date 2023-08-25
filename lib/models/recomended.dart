class RecomendedSongs {
  List<Songslist>? songslist;

  RecomendedSongs({this.songslist});

  RecomendedSongs.fromJson(json) {
    if (json != null) {
      songslist = <Songslist>[];
      json.forEach((v) {
        songslist!.add(new Songslist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.songslist != null) {
      data['songslist'] = this.songslist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Songslist {
  String? id;
  String? title;
  String? subtitle;
  String? headerDesc;
  String? type;
  String? permaUrl;
  String? image;
  String? language;
  String? year;
  String? playCount;
  String? explicitContent;
  String? listCount;
  String? listType;
  String? list;
  MoreInfo? moreInfo;

  Songslist(
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
      this.moreInfo});

  Songslist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    headerDesc = json['header_desc'];
    type = json['type'];
    permaUrl = json['perma_url'];
    image = json['image'];
    language = json['language'];
    year = json['year'];
    playCount = json['play_count'];
    explicitContent = json['explicit_content'];
    listCount = json['list_count'];
    listType = json['list_type'];
    list = json['list'];
    moreInfo = json['more_info'] != null
        ? new MoreInfo.fromJson(json['more_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['header_desc'] = this.headerDesc;
    data['type'] = this.type;
    data['perma_url'] = this.permaUrl;
    data['image'] = this.image;
    data['language'] = this.language;
    data['year'] = this.year;
    data['play_count'] = this.playCount;
    data['explicit_content'] = this.explicitContent;
    data['list_count'] = this.listCount;
    data['list_type'] = this.listType;
    data['list'] = this.list;
    if (this.moreInfo != null) {
      data['more_info'] = this.moreInfo!.toJson();
    }
    return data;
  }
}

class MoreInfo {
  String? music;
  String? albumId;
  String? album;
  String? label;
  String? origin;
  bool? isDolbyContent;
  String? s320kbps;
  String? encryptedMediaUrl;
  String? encryptedCacheUrl;
  String? albumUrl;
  String? duration;
  Rights? rights;
  String? cacheState;
  String? hasLyrics;
  String? lyricsSnippet;
  String? starred;
  String? copyrightText;

  String? releaseDate;
  String? labelUrl;
  String? vcode;
  String? vlink;
  bool? trillerAvailable;
  bool? requestJiotuneFlag;
  String? webp;

  MoreInfo(
      {this.music,
      this.albumId,
      this.album,
      this.label,
      this.origin,
      this.isDolbyContent,
      this.s320kbps,
      this.encryptedMediaUrl,
      this.encryptedCacheUrl,
      this.albumUrl,
      this.duration,
      this.rights,
      this.cacheState,
      this.hasLyrics,
      this.lyricsSnippet,
      this.starred,
      this.copyrightText,
      this.releaseDate,
      this.labelUrl,
      this.vcode,
      this.vlink,
      this.trillerAvailable,
      this.requestJiotuneFlag,
      this.webp});

  MoreInfo.fromJson(Map<String, dynamic> json) {
    music = json['music'];
    albumId = json['album_id'];
    album = json['album'];
    label = json['label'];
    origin = json['origin'];
    isDolbyContent = json['is_dolby_content'];
    s320kbps = json['320kbps'];
    encryptedMediaUrl = json['encrypted_media_url'];
    encryptedCacheUrl = json['encrypted_cache_url'];
    albumUrl = json['album_url'];
    duration = json['duration'];
    rights =
        json['rights'] != null ? new Rights.fromJson(json['rights']) : null;
    cacheState = json['cache_state'];
    hasLyrics = json['has_lyrics'];
    lyricsSnippet = json['lyrics_snippet'];
    starred = json['starred'];
    copyrightText = json['copyright_text'];

    releaseDate = json['release_date'];
    labelUrl = json['label_url'];
    vcode = json['vcode'];
    vlink = json['vlink'];
    trillerAvailable = json['triller_available'];
    requestJiotuneFlag = json['request_jiotune_flag'];
    webp = json['webp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['music'] = this.music;
    data['album_id'] = this.albumId;
    data['album'] = this.album;
    data['label'] = this.label;
    data['origin'] = this.origin;
    data['is_dolby_content'] = this.isDolbyContent;
    data['320kbps'] = this.s320kbps;
    data['encrypted_media_url'] = this.encryptedMediaUrl;
    data['encrypted_cache_url'] = this.encryptedCacheUrl;
    data['album_url'] = this.albumUrl;
    data['duration'] = this.duration;
    if (this.rights != null) {
      data['rights'] = this.rights!.toJson();
    }
    data['cache_state'] = this.cacheState;
    data['has_lyrics'] = this.hasLyrics;
    data['lyrics_snippet'] = this.lyricsSnippet;
    data['starred'] = this.starred;
    data['copyright_text'] = this.copyrightText;

    data['release_date'] = this.releaseDate;
    data['label_url'] = this.labelUrl;
    data['vcode'] = this.vcode;
    data['vlink'] = this.vlink;
    data['triller_available'] = this.trillerAvailable;
    data['request_jiotune_flag'] = this.requestJiotuneFlag;
    data['webp'] = this.webp;
    return data;
  }
}

class Rights {
  String? code;
  String? cacheable;
  String? deleteCachedObject;
  String? reason;

  Rights({this.code, this.cacheable, this.deleteCachedObject, this.reason});

  Rights.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    cacheable = json['cacheable'];
    deleteCachedObject = json['delete_cached_object'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['cacheable'] = this.cacheable;
    data['delete_cached_object'] = this.deleteCachedObject;
    data['reason'] = this.reason;
    return data;
  }
}
