import 'package:flutter_aliplayer/flutter_avpdef.dart';

class HttpConstant {
  static const String HTTP_HOST = 'https://alivc-demo.aliyuncs.com/';
  static const String HTTP_METHOD_GET = 'GET';
  static const String HTTP_METHOD_POST = 'POST';

  static const String GET_STS = 'player/getVideoSts';
  static const String GET_AUTH = 'player/getVideoPlayAuth';
  static const String GET_MPS = 'player/getVideoMps';

  static const String GET_VIDEO_LIST = 'player/getVideoList';
  static const String GET_RANDOM_USER = 'user/randomUser';
  static const String GET_RECOMMEND_VIDEO_LIST = 'vod/getRecommendVideoList';
}

class GlobalSettings {
  ///软硬解开关
  static bool mEnableHardwareDecoder = true;

  ///播放器日志开关
  static bool mEnableAliPlayerLog = true;

  ///播放器日志级别
  static int mLogLevel = FlutterAvpdef.AF_LOG_LEVEL_INFO;

  ///是否是精准seek
  static bool mEnableAccurateSeek = false;

  ///播放器名称
  static String mPlayerName = "";
}

/// 播放方式
enum ModeType { URL, STS, AUTH, MPS }

enum VideoShowMode { Grid, Srceen }

///播放源相关
class DataSourceRelated {
  static const String DEFAULT_REGION = "cn-shanghai";
  // static const String DEFAULT_VID = "6b357371ef3c45f4a06e2536fd534380";
  static const String DEFAULT_VID = "63566edb9f61417bb46b0bb2b26cb29e";

  static const String DEFAULT_URL =
      "https://alivc-demo-vod.aliyuncs.com/6b357371ef3c45f4a06e2536fd534380/53733986bce75cfc367d7554a47638c0-fd.mp4";

  static const String TYPE_KEY = "type";
  static const String REGION_KEY = "region";
  static const String URL_KEY = "url";
  static const String VID_KEY = "vid";
  static const String INDEX_KEY = "index";
  static const String ACCESSKEYID_KEY = "accessKeyId";
  static const String ACCESSKEYSECRET_KEY = "accessKeySecret";
  static const String SECURITYTOKEN_KEY = "securityToken";
  static const String PREVIEWTIME_KEY = "previewTime";
  static const String PLAYAUTH_KEY = "playAuth";
  static const String PLAYDOMAIN_KEY = "playDomain";
  static const String AUTHINFO_KEY = "authInfo";
  static const String HLSURITOKEN_KEY = "hlsUriToken";
  static const String DOWNLOAD_SAVE_PATH = "savePath";
  static const String DEFINITION_LIST = "definitionList";
}
