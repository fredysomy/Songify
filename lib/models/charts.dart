class ChartsList {
  List<Charts>? charts;

  ChartsList({this.charts});

  ChartsList.fromJson(Map<String, dynamic> json) {
    if (json['charts'] != null) {
      charts = <Charts>[];
      json['charts'].forEach((v) {
        charts!.add(new Charts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.charts != null) {
      data['charts'] = this.charts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Charts {
  String? id;
  String? image;
  String? title;
  String? type;
  int? count;
  String? permaUrl;
  String? listname;
  MoreInfo? moreInfo;
  String? subtitle;
  String? explicitContent;
  bool? miniObj;
  String? language;

  Charts(
      {this.id,
      this.image,
      this.title,
      this.type,
      this.count,
      this.permaUrl,
      this.listname,
      this.moreInfo,
      this.subtitle,
      this.explicitContent,
      this.miniObj,
      this.language});

  Charts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    type = json['type'];
    count = json['count'];
    permaUrl = json['perma_url'];
    listname = json['listname'];
    moreInfo = json['more_info'] != null
        ? new MoreInfo.fromJson(json['more_info'])
        : null;
    subtitle = json['subtitle'];
    explicitContent = json['explicit_content'];
    miniObj = json['mini_obj'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['title'] = this.title;
    data['type'] = this.type;
    data['count'] = this.count;
    data['perma_url'] = this.permaUrl;
    data['listname'] = this.listname;
    if (this.moreInfo != null) {
      data['more_info'] = this.moreInfo!.toJson();
    }
    data['subtitle'] = this.subtitle;
    data['explicit_content'] = this.explicitContent;
    data['mini_obj'] = this.miniObj;
    data['language'] = this.language;
    return data;
  }
}

class MoreInfo {
  int? songCount;
  String? firstname;

  MoreInfo({this.songCount, this.firstname});

  MoreInfo.fromJson(Map<String, dynamic> json) {
    songCount = json['song_count'];
    firstname = json['firstname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['song_count'] = this.songCount;
    data['firstname'] = this.firstname;
    return data;
  }
}
