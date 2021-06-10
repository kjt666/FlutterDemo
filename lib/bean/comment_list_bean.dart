import 'dart:core';

/// list : [{"id":"90005198","note_id":"3335233884500656157","send_user":"90006269","comment_type":"0","receive_user":"90006269","receive_cid":"0","receive_pid":"0","content":"非常棒的图片！！","create_time":"2021-06-04 11:53:31","digg_count":"0","status":"100","comment_count":"0","is_digg":"0","user_data":{"user_id":"90006269","name":"有书~8730","avatar":"http://avatar.youshu.cc/readwith/20210408/606eb24bf2335.jpg@100w_100h.jpg"},"comment_list":[],"source_scheme":"youshuapp://note?id=3335233884500656157","business_type":"104","business_id":"0","collection_id":"1","chapter_id":"3335233884500656157"},{"id":"90005197","note_id":"3335233884500656157","send_user":"90005749","comment_type":"0","receive_user":"90006269","receive_cid":"0","receive_pid":"0","content":"来自亚古兽的肯定[(!)]","create_time":"2021-06-04 11:52:16","digg_count":"0","status":"100","comment_count":"0","is_digg":"0","user_data":{"user_id":"90005749","name":"亚古兽","avatar":"http://avatar.youshu.cc/readwith/20200707/5f044b9422e95.jpg@100w_100h.jpg"},"comment_list":[],"source_scheme":"youshuapp://note?id=3335233884500656157","business_type":"104","business_id":"0","collection_id":"1","chapter_id":"3335233884500656157"},{"id":"90005196","note_id":"3335233884500656157","send_user":"90005749","comment_type":"0","receive_user":"90006269","receive_cid":"0","receive_pid":"0","content":"太好看了","create_time":"2021-06-04 11:51:37","digg_count":"0","status":"100","comment_count":"0","is_digg":"0","user_data":{"user_id":"90005749","name":"亚古兽","avatar":"http://avatar.youshu.cc/readwith/20200707/5f044b9422e95.jpg@100w_100h.jpg"},"comment_list":[],"source_scheme":"youshuapp://note?id=3335233884500656157","business_type":"104","business_id":"0","collection_id":"1","chapter_id":"3335233884500656157"}]

class CommentList {
  List<Comment> _list;

  List<Comment> get list => _list;

  CommentList({
      List<Comment> list}){
    _list = list;
}

  CommentList.fromJson(dynamic json) {
    if (json["list"] != null) {
      _list = [];
      json["list"].forEach((v) {
        _list.add(Comment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_list != null) {
      map["list"] = _list.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "90005198"
/// note_id : "3335233884500656157"
/// send_user : "90006269"
/// comment_type : "0"
/// receive_user : "90006269"
/// receive_cid : "0"
/// receive_pid : "0"
/// content : "非常棒的图片！！"
/// create_time : "2021-06-04 11:53:31"
/// digg_count : "0"
/// status : "100"
/// comment_count : "0"
/// is_digg : "0"
/// user_data : {"user_id":"90006269","name":"有书~8730","avatar":"http://avatar.youshu.cc/readwith/20210408/606eb24bf2335.jpg@100w_100h.jpg"}
/// comment_list : []
/// source_scheme : "youshuapp://note?id=3335233884500656157"
/// business_type : "104"
/// business_id : "0"
/// collection_id : "1"
/// chapter_id : "3335233884500656157"

class Comment {
  String _id;
  String _noteId;
  String _sendUser;
  String _commentType;
  String _receiveUser;
  String _receiveCid;
  String _receivePid;
  String _content;
  String _createTime;
  String _diggCount;
  String _status;
  String _commentCount;
  String _isDigg;
  User_data _userData;
  List<dynamic> _commentList;
  String _sourceScheme;
  String _businessType;
  String _businessId;
  String _collectionId;
  String _chapterId;

  String get id => _id;
  String get noteId => _noteId;
  String get sendUser => _sendUser;
  String get commentType => _commentType;
  String get receiveUser => _receiveUser;
  String get receiveCid => _receiveCid;
  String get receivePid => _receivePid;
  String get content => _content;
  String get createTime => _createTime;
  String get diggCount => _diggCount;
  set diggCount(String value) => _diggCount = value;
  String get status => _status;
  String get commentCount => _commentCount;
  String get isDigg => _isDigg;
  set isDigg(String value)=> _isDigg = value;
  User_data get userData => _userData;
  List<dynamic> get commentList => _commentList;
  String get sourceScheme => _sourceScheme;
  String get businessType => _businessType;
  String get businessId => _businessId;
  String get collectionId => _collectionId;
  String get chapterId => _chapterId;

  Comment({
      String id, 
      String noteId, 
      String sendUser, 
      String commentType, 
      String receiveUser, 
      String receiveCid, 
      String receivePid, 
      String content, 
      String createTime, 
      String diggCount, 
      String status, 
      String commentCount, 
      String isDigg, 
      User_data userData, 
      List<dynamic> commentList, 
      String sourceScheme, 
      String businessType, 
      String businessId, 
      String collectionId, 
      String chapterId}){
    _id = id;
    _noteId = noteId;
    _sendUser = sendUser;
    _commentType = commentType;
    _receiveUser = receiveUser;
    _receiveCid = receiveCid;
    _receivePid = receivePid;
    _content = content;
    _createTime = createTime;
    _diggCount = diggCount;
    _status = status;
    _commentCount = commentCount;
    _isDigg = isDigg;
    _userData = userData;
    _commentList = commentList;
    _sourceScheme = sourceScheme;
    _businessType = businessType;
    _businessId = businessId;
    _collectionId = collectionId;
    _chapterId = chapterId;
}

  Comment.fromJson(dynamic json) {
    _id = json["id"];
    _noteId = json["note_id"];
    _sendUser = json["send_user"];
    _commentType = json["comment_type"];
    _receiveUser = json["receive_user"];
    _receiveCid = json["receive_cid"];
    _receivePid = json["receive_pid"];
    _content = json["content"];
    _createTime = json["create_time"];
    _diggCount = json["digg_count"];
    _status = json["status"];
    _commentCount = json["comment_count"];
    _isDigg = json["is_digg"];
    _userData = json["user_data"] != null ? User_data.fromJson(json["user_data"]) : null;
    /*if (json["comment_list"] != null) {
      _commentList = [];
      json["comment_list"].forEach((v) {
        _commentList.add(dynamic.fromJson(v));
      });
    }*/
    _sourceScheme = json["source_scheme"];
    _businessType = json["business_type"];
    _businessId = json["business_id"];
    _collectionId = json["collection_id"];
    _chapterId = json["chapter_id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["note_id"] = _noteId;
    map["send_user"] = _sendUser;
    map["comment_type"] = _commentType;
    map["receive_user"] = _receiveUser;
    map["receive_cid"] = _receiveCid;
    map["receive_pid"] = _receivePid;
    map["content"] = _content;
    map["create_time"] = _createTime;
    map["digg_count"] = _diggCount;
    map["status"] = _status;
    map["comment_count"] = _commentCount;
    map["is_digg"] = _isDigg;
    if (_userData != null) {
      map["user_data"] = _userData.toJson();
    }
   /* if (_commentList != null) {
      map["comment_list"] = _commentList.map((v) => v.toJson()).toList();
    }*/
    map["source_scheme"] = _sourceScheme;
    map["business_type"] = _businessType;
    map["business_id"] = _businessId;
    map["collection_id"] = _collectionId;
    map["chapter_id"] = _chapterId;
    return map;
  }

}

/// user_id : "90006269"
/// name : "有书~8730"
/// avatar : "http://avatar.youshu.cc/readwith/20210408/606eb24bf2335.jpg@100w_100h.jpg"

class User_data {
  String _userId;
  String _name;
  String _avatar;

  String get userId => _userId;
  String get name => _name;
  String get avatar => _avatar;

  User_data({
      String userId, 
      String name, 
      String avatar}){
    _userId = userId;
    _name = name;
    _avatar = avatar;
}

  User_data.fromJson(dynamic json) {
    _userId = json["user_id"];
    _name = json["name"];
    _avatar = json["avatar"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["user_id"] = _userId;
    map["name"] = _name;
    map["avatar"] = _avatar;
    return map;
  }

}