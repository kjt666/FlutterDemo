class MediaInfo {
  OssToken ossToken;
  VideoInfo videoInfo;
  AudioInfo audioInfo;
  MediaViewInfo mediaViewInfo;

  MediaInfo(
      {this.ossToken, this.videoInfo, this.audioInfo, this.mediaViewInfo});

  MediaInfo.fromJson(dynamic json) {
    ossToken = json['oss_token'] != null
        ? new OssToken.fromJson(json['oss_token'])
        : null;
    videoInfo = json['video_info'] != null
        ? new VideoInfo.fromJson(json['video_info'])
        : null;
    audioInfo = json['audio_info'] != null
        ? new AudioInfo.fromJson(json['audio_info'])
        : null;
    mediaViewInfo = json['media_view_info'] != null
        ? new MediaViewInfo.fromJson(json['media_view_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ossToken != null) {
      data['oss_token'] = this.ossToken.toJson();
    }
    if (this.videoInfo != null) {
      data['video_info'] = this.videoInfo.toJson();
    }
    if (this.audioInfo != null) {
      data['audio_info'] = this.audioInfo.toJson();
    }
    if (this.mediaViewInfo != null) {
      data['media_view_info'] = this.mediaViewInfo.toJson();
    }
    return data;
  }
}

class OssToken {
  String statusCode;
  String accessKeyId;
  String accessKeySecret;
  String expiration;
  String securityToken;

  OssToken(
      {this.statusCode,
      this.accessKeyId,
      this.accessKeySecret,
      this.expiration,
      this.securityToken});

  OssToken.fromJson(dynamic json) {
    statusCode = json['StatusCode'];
    accessKeyId = json['AccessKeyId'];
    accessKeySecret = json['AccessKeySecret'];
    expiration = json['Expiration'];
    securityToken = json['SecurityToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StatusCode'] = this.statusCode;
    data['AccessKeyId'] = this.accessKeyId;
    data['AccessKeySecret'] = this.accessKeySecret;
    data['Expiration'] = this.expiration;
    data['SecurityToken'] = this.securityToken;
    return data;
  }
}

class VideoInfo {
  String videoId;
  String videoUrl;
  String videoKey;

  VideoInfo({this.videoId, this.videoUrl, this.videoKey});

  VideoInfo.fromJson(dynamic json) {
    videoId = json['video_id'];
    videoUrl = json['video_url'];
    videoKey = json['video_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video_id'] = this.videoId;
    data['video_url'] = this.videoUrl;
    data['video_key'] = this.videoKey;
    return data;
  }
}

class AudioInfo {
  String audioId;
  String audioKey;
  String audioUrl;

  AudioInfo({this.audioId, this.audioKey, this.audioUrl});

  AudioInfo.fromJson(dynamic json) {
    audioId = json['audio_id'];
    audioKey = json['audio_key'];
    audioUrl = json['audio_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['audio_id'] = this.audioId;
    data['audio_key'] = this.audioKey;
    data['audio_url'] = this.audioUrl;
    return data;
  }
}

class MediaViewInfo {
  String cover;
  String title;
  String mediaTime;
  String businessType;

  MediaViewInfo({this.cover, this.title, this.mediaTime, this.businessType});

  MediaViewInfo.fromJson(dynamic json) {
    cover = json['cover'];
    title = json['title'];
    mediaTime = json['media_time'];
    businessType = json['business_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cover'] = this.cover;
    data['title'] = this.title;
    data['media_time'] = this.mediaTime;
    data['business_type'] = this.businessType;
    return data;
  }
}
