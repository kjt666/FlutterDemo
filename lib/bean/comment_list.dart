/// list : [{"id":"90005208","note_id":"3335233884500656157","send_user":"90005784","comment_type":"0","receive_user":"90006269","receive_cid":"0","receive_pid":"0","content":"“总书记来到我们家里，屋里屋外仔细察看。他待人真是亲切，让我们非常感动。”回忆起自己拿着照片向总书记介绍生活变化的场景，身着藏族盛装的索南才让满脸笑意。","create_time":"2021-06-10 11:07:08","digg_count":"2","status":"100","comment_count":"1","is_digg":"1","user_data":{"user_id":"90005784","name":"生如夏花之绚丽","avatar":"http://avatar.youshu.cc/readwith/20200609/5edf7a530b50d.jpeg@100w_100h.jpg"},"comment_list":[{"id":"90005211","note_id":"3335233884500656157","send_user":"90005749","comment_type":"1","receive_user":"90005784","receive_cid":"90005208","receive_pid":"90005208","content":"“修身以为弓，矫思以为矢，立义以为的，奠而后发，发必中矣。”","create_time":"2021-06-11 10:21:58","digg_count":"0","status":"100","user_data":{"user_id":"90005749","name":"亚古兽","avatar":"http://avatar.youshu.cc/readwith/20200707/5f044b9422e95.jpg@100w_100h.jpg"},"reply_user_data":{"user_id":"90005784","name":"生如夏花之绚丽","avatar":"http://avatar.youshu.cc/readwith/20200609/5edf7a530b50d.jpeg@100w_100h.jpg"}}],"source_scheme":"youshuapp://note id=3335233884500656157","business_type":"104","business_id":"0","collection_id":"1","chapter_id":"3335233884500656157"}]

class CommentList {
  List<Comment>  _list = List.empty(growable: true);

  List<Comment>  get list => _list;

  CommentList({
    required List<Comment>  list}){
    _list = list;
  }

  CommentList.fromJson(dynamic json) {
    if (json["list"] != null) {
      _list = [];
      json["list"].forEach((v) {
        _list .add(Comment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_list != null) {
      map["list"] = _list .map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  String toString() {
    return 'CommentList{_list: $_list}';
  }
}

/// id : "90005208"
/// note_id : "3335233884500656157"
/// send_user : "90005784"
/// comment_type : "0"
/// receive_user : "90006269"
/// receive_cid : "0"
/// receive_pid : "0"
/// content : "“总书记来到我们家里，屋里屋外仔细察看。他待人真是亲切，让我们非常感动。”回忆起自己拿着照片向总书记介绍生活变化的场景，身着藏族盛装的索南才让满脸笑意。"
/// create_time : "2021-06-10 11:07:08"
/// digg_count : "2"
/// status : "100"
/// comment_count : "1"
/// is_digg : "1"
/// user_data : {"user_id":"90005784","name":"生如夏花之绚丽","avatar":"http://avatar.youshu.cc/readwith/20200609/5edf7a530b50d.jpeg@100w_100h.jpg"}
/// comment_list : [{"id":"90005211","note_id":"3335233884500656157","send_user":"90005749","comment_type":"1","receive_user":"90005784","receive_cid":"90005208","receive_pid":"90005208","content":"“修身以为弓，矫思以为矢，立义以为的，奠而后发，发必中矣。”","create_time":"2021-06-11 10:21:58","digg_count":"0","status":"100","user_data":{"user_id":"90005749","name":"亚古兽","avatar":"http://avatar.youshu.cc/readwith/20200707/5f044b9422e95.jpg@100w_100h.jpg"},"reply_user_data":{"user_id":"90005784","name":"生如夏花之绚丽","avatar":"http://avatar.youshu.cc/readwith/20200609/5edf7a530b50d.jpeg@100w_100h.jpg"}}]
/// source_scheme : "youshuapp://note id=3335233884500656157"
/// business_type : "104"
/// business_id : "0"
/// collection_id : "1"
/// chapter_id : "3335233884500656157"

class Comment {
  String  _id = "";
  String  _noteId= "";
  String  _sendUser= "";
  String  _commentType= "";
  String  _receiveUser= "";
  String  _receiveCid= "";
  String  _receivePid= "";
  String  _content= "";
  String  _createTime= "";
  String  _diggCount= "";
  String  _status= "";
  String  _commentCount= "";
  String  _isDigg= "";
  User_data?  _userData;
  List<Comment_list>  _commentList = List.empty(growable: true);
  String  _sourceScheme= "";
  String  _businessType= "";
  String  _businessId= "";
  String  _collectionId= "";
  String  _chapterId= "";

  String  get id => _id;
  String  get noteId => _noteId;
  String  get sendUser => _sendUser;
  String  get commentType => _commentType;
  String  get receiveUser => _receiveUser;
  String  get receiveCid => _receiveCid;
  String  get receivePid => _receivePid;
  String  get content => _content;
  String  get createTime => _createTime;
  String  get diggCount => _diggCount;
  set diggCount(String value) => _diggCount = value;
  String  get status => _status;
  String  get commentCount => _commentCount;
  String  get isDigg => _isDigg;
  set isDigg(String value) => _isDigg = value;
  User_data?  get userData => _userData;
  List<Comment_list>  get commentList => _commentList;
  String  get sourceScheme => _sourceScheme;
  String  get businessType => _businessType;
  String  get businessId => _businessId;
  String  get collectionId => _collectionId;
  String  get chapterId => _chapterId;

  /*Comment({
    String  id,
    String  noteId,
    String  sendUser,
    String  commentType,
    String  receiveUser,
    String  receiveCid,
    String  receivePid,
    String  content,
    String  createTime,
    String  diggCount,
    String  status,
    String  commentCount,
    String  isDigg,
    User_data  userData,
    List<Comment_list>  commentList,
    String  sourceScheme,
    String  businessType,
    String  businessId,
    String  collectionId,
    String  chapterId}){
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
  }*/

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
    _userData = json["user_data"] != null  ? User_data.fromJson(json["user_data"]) : null;
    if (json["comment_list"] != null) {
      _commentList = [];
      json["comment_list"].forEach((v) {
        _commentList .add(Comment_list.fromJson(v));
      });
    }
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
      map["user_data"] = _userData?.toJson();
    }
    if (_commentList != null) {
      map["comment_list"] = _commentList .map((v) => v.toJson()).toList();
    }
    map["source_scheme"] = _sourceScheme;
    map["business_type"] = _businessType;
    map["business_id"] = _businessId;
    map["collection_id"] = _collectionId;
    map["chapter_id"] = _chapterId;
    return map;
  }

  @override
  String toString() {
    return 'Comment{_id: $_id, _noteId: $_noteId, _sendUser: $_sendUser, _commentType: $_commentType, _receiveUser: $_receiveUser, _receiveCid: $_receiveCid, _receivePid: $_receivePid, _content: $_content, _createTime: $_createTime, _diggCount: $_diggCount, _status: $_status, _commentCount: $_commentCount, _isDigg: $_isDigg, _userData: $_userData, _commentList: $_commentList, _sourceScheme: $_sourceScheme, _businessType: $_businessType, _businessId: $_businessId, _collectionId: $_collectionId, _chapterId: $_chapterId}';
  }
}

/// id : "90005211"
/// note_id : "3335233884500656157"
/// send_user : "90005749"
/// comment_type : "1"
/// receive_user : "90005784"
/// receive_cid : "90005208"
/// receive_pid : "90005208"
/// content : "“修身以为弓，矫思以为矢，立义以为的，奠而后发，发必中矣。”"
/// create_time : "2021-06-11 10:21:58"
/// digg_count : "0"
/// status : "100"
/// user_data : {"user_id":"90005749","name":"亚古兽","avatar":"http://avatar.youshu.cc/readwith/20200707/5f044b9422e95.jpg@100w_100h.jpg"}
/// reply_user_data : {"user_id":"90005784","name":"生如夏花之绚丽","avatar":"http://avatar.youshu.cc/readwith/20200609/5edf7a530b50d.jpeg@100w_100h.jpg"}

class Comment_list {
  String  _id = "";
  String  _noteId = "";
  String  _sendUser = "";
  String  _commentType = "";
  String  _receiveUser = "";
  String  _receiveCid = "";
  String  _receivePid = "";
  String  _content = "";
  String  _createTime = "";
  String  _diggCount = "";
  String  _status = "";
  User_data?  _userData;
  Reply_user_data?  _replyUserData;

  String  get id => _id;
  String  get noteId => _noteId;
  String  get sendUser => _sendUser;
  String  get commentType => _commentType;
  String  get receiveUser => _receiveUser;
  String  get receiveCid => _receiveCid;
  String  get receivePid => _receivePid;
  String  get content => _content;
  String  get createTime => _createTime;
  String  get diggCount => _diggCount;
  String  get status => _status;
  User_data?  get userData => _userData;
  Reply_user_data?  get replyUserData => _replyUserData;

  /*Comment_list({
    String  id,
    String  noteId,
    String  sendUser,
    String  commentType,
    String  receiveUser,
    String  receiveCid,
    String  receivePid,
    String  content,
    String  createTime,
    String  diggCount,
    String  status,
    User_data  userData,
    Reply_user_data  replyUserData}){
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
    _userData = userData;
    _replyUserData = replyUserData;
  }*/

  Comment_list.fromJson(dynamic json) {
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
    _userData = json["user_data"] != null  ? User_data.fromJson(json["user_data"]) : null;
    _replyUserData = json["reply_user_data"] != null  ? Reply_user_data.fromJson(json["reply_user_data"]) : null;
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
    if (_userData != null) {
      map["user_data"] = _userData?.toJson();
    }
    if (_replyUserData != null) {
      map["reply_user_data"] = _replyUserData?.toJson();
    }
    return map;
  }

  @override
  String toString() {
    return 'Comment_list{_id: $_id, _noteId: $_noteId, _sendUser: $_sendUser, _commentType: $_commentType, _receiveUser: $_receiveUser, _receiveCid: $_receiveCid, _receivePid: $_receivePid, _content: $_content, _createTime: $_createTime, _diggCount: $_diggCount, _status: $_status, _userData: $_userData, _replyUserData: $_replyUserData}';
  }
}

/// user_id : "90005784"
/// name : "生如夏花之绚丽"
/// avatar : "http://avatar.youshu.cc/readwith/20200609/5edf7a530b50d.jpeg@100w_100h.jpg"

class Reply_user_data {
  String  _userId = "";
  String  _name = "";
  String  _avatar = "";

  String  get userId => _userId;
  String  get name => _name;
  String  get avatar => _avatar;

  /*Reply_user_data({
    String  userId,
    String  name,
    String  avatar}){
    _userId = userId;
    _name = name;
    _avatar = avatar;
  }*/

  Reply_user_data.fromJson(dynamic json) {
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

/// user_id : "90005749"
/// name : "亚古兽"
/// avatar : "http://avatar.youshu.cc/readwith/20200707/5f044b9422e95.jpg@100w_100h.jpg"

class User_data {
  String  _userId = "";
  String  _name = "";
  String  _avatar = "";

  String  get userId => _userId;
  String  get name => _name;
  String  get avatar => _avatar;

  /*User_data({
    String  userId,
    String  name,
    String  avatar}){
    _userId = userId;
    _name = name;
    _avatar = avatar;
  }*/

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

  @override
  String toString() {
    return 'User_data{_userId: $_userId, _name: $_name, _avatar: $_avatar}';
  }
}