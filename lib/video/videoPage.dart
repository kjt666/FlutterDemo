import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/bean/note_info_bean.dart';
import 'package:flutter_app/video/vedio_player_widget.dart';

import 'media_info.dart';

class VideoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VideoPageState();
  }
}

class VideoPageState extends State<VideoPage> {
  String noteInfoStr = "{\"id\": \"3207053159780450324\",		\"user_id\": \"90005716\",		\"book_id\": \"0\",		\"title\": \"17岁放弃清华北大，20岁怀孕考上哈佛：她的人生，可以复制！\",		\"content\": \"<p style=\\\"line-height: 1.5em;\\\">17岁放弃清华北大，20岁怀孕考上哈佛：她的人生，可以复制！17岁放弃清华北大，20岁怀孕考上哈佛：她的人生，可以复制！17岁放弃清华北大，20岁怀孕考上哈佛：她的人生，可以复制！17岁放弃清华北大，20岁怀孕考上哈佛：她的人生，可以复制！17岁放弃清华北大，20岁怀孕考上哈佛：她的人生，可以复制！17岁放弃清华北大，20岁怀孕考上哈佛：她的人生，可以复制！17岁放弃清华北大，20岁怀孕考上哈佛：她的人生，可以复制！17岁放弃清华北大，20岁怀孕考上哈佛：她的人生，可以复制！17岁放弃清华北大，20岁怀孕考上哈佛：她的人生，可以复制！<\\/p>\",		\"img_str\": [\"https:\\/\\/img.youshu.cc\\/readoo\\/20200615\\/5ee750bc2f7c0.png\"],		\"digg_count\": \"3\",		\"comment_count\": \"14\",		\"read_count\": \"471\",		\"is_delete\": \"0\",		\"is_pub\": \"0\",		\"is_top\": \"0\",		\"stick\": \"0\",		\"is_tougao\": \"0\",		\"share_note_id\": \"0\",		\"share_type\": \"\",		\"pb_id\": \"0\",		\"note_type\": \"30\",		\"buss_id\": \"0\",		\"length\": \"270\",		\"address\": \"\",		\"create_time\": \"2020-06-15 18:44:17\",		\"update_time\": \"2020-06-15 18:44:17\",		\"share_ext\": \"\",		\"user_stick\": \"\",		\"is_handled\": \"0\",		\"handle_account_id\": \"0\",		\"handle_time\": \"\",		\"money\": \"0\",		\"contribute_num\": \"0\",		\"plan_id\": \"0\",		\"content_type\": \"3\",		\"source\": \"0\",		\"is_notice\": \"0\",		\"new_note_id\": \"3207053159780450324\",		\"audio_key\": \"\",		\"head_img\": \"http:\\/\\/img.youshu.cc\\/readoo\\/20200615\\/5ee750bc2f7c0.png\",		\"audio_book_id\": \"2009\",		\"theme_book_list_id\": \"0\",		\"video_len\": \"131\",		\"video_size\": \"7984239\",		\"video_status\": \"2\",		\"video_id\": \"c22b0038e4a945989ad18dfafedadaa5\",		\"audio_len\": \"0\",		\"audio_size\": \"31909557\",		\"audio_title\": \"播放音频\",		\"audio_image\": \"\",		\"audio_status\": \"5\",		\"tags\": [],		\"buss_type\": \"1\",		\"is_select\": \"0\",		\"relate_user\": [],		\"link_config\": [],		\"img_native\": \"readoo\\/20200615\\/5ee750bc2f7c0.png\",		\"abstract\": \"17岁放弃清华北大，20岁怀孕考上哈佛：她的人生，可以复制！17岁放弃清华北大，20岁怀孕考上哈佛：她的人生，可以复制！17岁放弃清华北大，20岁怀孕考上哈佛：她的人生，可以复制！17岁放弃清华北大，20岁怀孕考上哈佛：她的人生，可以复制！17岁放弃清华北大，20岁怀孕考上哈佛：她的人生，可以复制！17岁放弃清华北大，20岁怀孕考上哈佛：她的人生，可以复制！17岁放弃清华北大，20岁怀孕考上哈佛：\",		\"like_num\": \"5\",		\"share_count\": \"0\",		\"is_can_delete_audio\": \"0\",		\"img\": [{			\"large\": \"https:\\/\\/img.youshu.cc\\/readoo\\/20200615\\/5ee750bc2f7c0.png\",			\"small\": \"https:\\/\\/img.youshu.cc\\/readoo\\/20200615\\/5ee750bc2f7c0.png@!hq350\"		}],		\"preload_user\": {			\"data\": {				\"pageInfo\": {					\"user\": {						\"level_name\": \"秀才\",						\"join_days\": \"1066\",						\"level\": \"4\",						\"name\": \"阿国\",						\"user_id\": \"90005716\",						\"avatar\": \"http:\\/\\/avatar.youshu.cc\\/readwith\\/20200615\\/5ee744b5114ed.png\",						\"user_type\": \"2\",						\"intro\": \"幸亏我喝完了XP密钥，你走的木工发现了7米一口一口，我送你信吗就是我没有息肉。\\n你自己玩LOL吗你去学校了咯，哦无所谓咯\",						\"fans_count\": \"5\",						\"follow_count\": \"6\"					}				}			}		},		\"user_data\": {			\"user_id\": \"90005716\",			\"name\": \"阿国\",			\"sex\": \"1\",			\"level\": \"10\",			\"avatar\": \"http:\\/\\/avatar.youshu.cc\\/readwith\\/20200615\\/5ee744b5114ed.png\",			\"badge_id\": \"0\",			\"intro\": \"幸亏我喝完了XP密钥，你走的木工发现了7米一口一口，我送你信吗就是我没有息肉。\\n你自己玩LOL吗你去学校了咯，哦无所谓咯\",			\"user_type\": \"2\",			\"fans_count\": \"5\",			\"follow_count\": \"6\",			\"auth_icon\": \"pic_lianduren\",			\"is_vip\": \"1\",			\"auth_title\": \"测试账号\"		},		\"book_title\": \"\",		\"is_digg\": \"0\",		\"is_fav\": \"0\",		\"is_follow\": \"1\",		\"is_append_img\": \"0\",		\"relation_data\": {			\"item_type\": \"audio_book\",			\"item_value\": 2009,			\"title\": \"关联听书\",			\"relation_title\": \"好好说话\",			\"relation_cover\": \"https:\\/\\/img.youshu.cc\\/readoo\\/20180813\\/5b7171e48e9da.png\",			\"author\": \"马东,马薇薇,黄执中,周玄毅,邱晨,胡渐彪,刘京京\",			\"scheme\": \"youshuapp:\\/\\/audio_book_page?business_id=1000&audio_book_id=2009&chapter_id=32418\",			\"relation_status\": \"\"		},		\"audio_url\": \"\",		\"play_auth\": \"eyJTZWN1cml0eVRva2VuIjoiQ0FJUy9RSjFxNkZ0NUIyeWZTaklyNWZYTElqaHByeHAxcXlsUjNHQWgxTVdaOTRkMjRUOHFqejJJSHBLZVhkdUFlQVhzL28wbW1oWjcvWVlscmtxRU1JWUZSMkJkYzk1LzZoUThnNm5PeFpvWjE4R3RlNXFzb2FzUEVUT0liV1N2cWFMRVRDUUxyNzBmdk9xZENvKy8wMFg2TERtZERLa2NrVzRPSm1TOC9CT1pjZ1dXUS9LZjFnaEd0QmFkQ1J2dFBjZVBHcndNL2lxVUdUMGhXYUNJMGQwaEF0d2hHUlU3cUt4dzhMK2pCL0Nsdy9DenVZRXFwN1lQNFNrRGExcElJd3RhOU84emMxd2VLMmp0aXRNOEVwbStheHNuYlJZMmpyVzNLaURCRlVEekJpYUg5RHgxdHhrSVFsaWE4cEFCYWxJL3RmeGlkRkNuOGZlalpqV3pSaEtSNVkzTlI3U1g0ZTkyc0RKTmZxMFA5SWlEOWJCTm0vS3o4cUVPK3VlMFdwbVF3cENaRndSSllWeGR5Y3VVRVp3RW15RkVNTDlwZ0NXT0RYRVlyT2V6YVE3M2FCeXkxalY1dGVRTHpDTk9lN0RqM3RHWk1kc1BoNTJiRUJPakRXeEtMVjZXZ2hOWWs1aE9iR1pkb3g2ZHl0Q3NwbnZ1UURDcDRPWENJVzhmWllhZ0FHcXBwaVN6S0laYmxkaHFpZnhrWDNYQi9XRGhsSkZvdU9KQnpzWjI3bGQ0UWVCWGNnbEh1NVRIbnBQNTVweG44c2g5djUxUlg0eWFGaFhkSzAyZm85czk0YnNrdEE2QWVBSDljR0RrT0pFbHlvaFRpRHRSa0J4Qnp4dlRRV1ZaQmpWOVZ6M09oeGVPYU9ZWkRMVUF3TjlKNzA5SUhxTjFRRlY4Tjh6dklkditRPT0iLCJBdXRoSW5mbyI6IntcIkNJXCI6XCJMTXNjbkxkR1RLdnovSmpIVy9xWHFleGhHbURlUE5IRmxZMmxVMWltQnhEVVVzVXlkRGlWd3lhTGlmcnBURWt2dEZvV2ttdDVWKzF3azNlRXhSRms3UT09XCIsXCJDYWxsZXJcIjpcImR5eXB1QWVBMXdnUHF4eFZpQTNXYVE9PVwiLFwiRXhwaXJlVGltZVwiOlwiMjAyMy0wMS0xN1QxMTowOTozMVpcIixcIk1lZGlhSWRcIjpcImMyMmIwMDM4ZTRhOTQ1OTg5YWQxOGRmYWZlZGFkYWE1XCIsXCJQbGF5RG9tYWluXCI6XCJ2bS55b3VzaHUuY2NcIixcIlNpZ25hdHVyZVwiOlwiQVhMRUxFZjI1N2ZkbkNEMTkyL2EwUXVZbFBRPVwifSIsIlZpZGVvTWV0YSI6eyJTdGF0dXMiOiJOb3JtYWwiLCJWaWRlb0lkIjoiYzIyYjAwMzhlNGE5NDU5ODlhZDE4ZGZhZmVkYWRhYTUiLCJUaXRsZSI6IuWKoOaLv+Wkp+WtpueUny5tcDQiLCJDb3ZlclVSTCI6Imh0dHBzOi8vdm0ueW91c2h1LmNjL2MyMmIwMDM4ZTRhOTQ1OTg5YWQxOGRmYWZlZGFkYWE1L2NvdmVycy8yNGFmYzFhOTg4ZDA0YTkyODE0MzA4M2VhMmFhNjJiNi0wMDAwNS5qcGciLCJEdXJhdGlvbiI6MTMxLjAyNH0sIkFjY2Vzc0tleUlkIjoiU1RTLk5UYmcyVUtjSGFuTkVXMWNTQ2tRMTRBV0giLCJQbGF5RG9tYWluIjoidm0ueW91c2h1LmNjIiwiQWNjZXNzS2V5U2VjcmV0IjoiNjh0cmNkYzQxYTJaVzVqUTFjZXF2TUVpWDlxVnZ0N0tOcjE3YWNWYXJjYjMiLCJSZWdpb24iOiJjbi1zaGFuZ2hhaSIsIkN1c3RvbWVySWQiOjEzNTU4OX0=\",		\"video_width\": \"640\",		\"video_height\": \"368\",		\"play_data\": {			\"business_type\": \"104\",			\"collection_id\": \"3207053159780450324\",			\"media_type\": \"2\"		},		\"content_load_type\": \"2\",		\"share_img\": \"https:\\/\\/img.youshu.cc\\/readoo\\/20200615\\/5ee750bc2f7c0.png\",		\"share_jump_url\": \"https:\\/\\/qa-zaiadev.laidan.com\\/p\\/app_web\\/ysh_article?note_id=3207053159780450324&utm_source=share_app&utm_campaign=article_3207053159780450324&utm_term=uid_90006269\",		\"is_show_mask\": \"2\",		\"group_scheme\": \"\",		\"note_info_url\": \"https:\\/\\/qa-m.laidan.com\\/weixin\\/app\\/noteDetail?note_id=3207053159780450324\",		\"word_count\": \"270\",		\"is_buy\": \"0\",		\"is_sub\": \"0\",		\"is_sub_member\": \"0\",		\"topic_data\": {},		\"topic_list\": [],		\"note_list\": [],		\"share_qr_code\": \"http:\\/\\/feed.youshu.cc\\/readwith\\/media\\/picture\\/6358d7ba7dfa7.png\"	}";
  String mediaInfoStr = "{		\"oss_token\": {			\"StatusCode\": \"200\",			\"AccessKeyId\": \"STS.NTGL1pvHZ7pKegjYV9YaWfw8J\",			\"AccessKeySecret\": \"5x9h1NuXKTpW6Hz6Kpoy4BWGnj3An1w2EB76t7tPBi9D\",			\"Expiration\": \"2023-01-18T08:47:08Z\",			\"SecurityToken\": \"CAIS6gF1q6Ft5B2yfSjIr5fyB4vEm5d7gLKgZ0HbvVZsVe57ibKTqDz2IHhJenhhAuwZtfU0lG9Y7\\/YYlqJ4T55IQ1Dza8J148zvZ9Zp19KT1fau5Jko1beHewHKeTOZsebWZ+LmNqC\\/Ht6md1HDkAJq3LL+bk\\/Mdle5MJqP+\\/UFB5ZtKWveVzddA8pMLQZPsdITMWCrVcygKRn3mGHdfiEK00he5zoktPnvk\\/fxsESO0AfIrcYOvJn0L5SeaM1hAYxySd\\/d3pYtLvefgX8Lt0cRpfwm0\\/wdqW3d2cuUBkNc6hmBNe7F6NprIR+0rcgagAEWei7a7lYqE7HL3\\/jK3eMvdYlQuXrcByvhESYzxaQy34n9DQoz26jwfXJkBR9BWTfjtTRToYI+YtLBJTW9IHboxGWq70o\\/edKyxPiM00gIEP5\\/UV2GO2bQIe9iXFUZtCOFtqQdXKTMCHUTbPSR4RBVTFa7UG3MKt0ISmTJulQU8g==\"		},		\"video_info\": {			\"video_id\": \"c22b0038e4a945989ad18dfafedadaa5\",			\"video_url\": \"\",			\"video_key\": \"\"		},		\"audio_info\": {			\"audio_id\": \"\",			\"audio_key\": \"\",			\"audio_url\": \"\"		},		\"media_view_info\": {			\"cover\": \"http:\\/\\/img.youshu.cc\\/readoo\\/20200615\\/5ee750bc2f7c0.png\",			\"title\": \"播放音频\",			\"media_time\": \"00:00\",			\"business_type\": \"104\"		}	}";

  MediaInfo mediaInfo = MediaInfo();
  NoteInfo noteInfo = NoteInfo();
  GlobalKey<VideoPlayerViewState> videoKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> dataMap = json.decoder.convert(noteInfoStr);
    noteInfo = NoteInfo.fromJson(dataMap);
    Map<String, dynamic> dataMap2 = json.decoder.convert(mediaInfoStr);
    mediaInfo = MediaInfo.fromJson(dataMap2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AliVideoView"),
      ),
      body: Container(child: _getVideo(),),
    );
  }

  ///头部视频布局
  Widget _getVideo() {
    Orientation orientation = MediaQuery.of(context).orientation;
    var barHeight = MediaQueryData.fromWindow(window).padding.top;

    var width = MediaQuery.of(context).size.width;
    var height;
    if (orientation == Orientation.portrait) {
      var videoH = width /
          (int.parse(noteInfo.video_width) / int.parse(noteInfo.video_height));
      if (videoH > MediaQuery.of(context).size.height / 2) {
        videoH = MediaQuery.of(context).size.height / 2;
      }
      height = videoH > 0
          ? videoH
          : width * 9.0 / 15.0 - 5.0;
    } else {
      height = MediaQuery.of(context).size.height;
    }
    return mediaInfo.videoInfo != null
        ? VideoPlayerView(
        key: videoKey,
        mediaInfo: mediaInfo,
        noteInfo: noteInfo,
    )
        : SliverToBoxAdapter();
  }
}
