

/// user_data : {"user_id":"90006269","name":"有书~8730","user_type":"0","sex":"0","avatar":"http://avatar.youshu.cc/ys_default.png","job":"","intro":"","province":"","city":"","create_time":"2020-08-24 10:41:54","rec":"","xingqu":"","level":"1","badge_id":"0","is_unlock":"1","flag_old_exp":"1","exp":"4350","user_img":"","wechat_id":"","education":"0","age":"0","coins":"2270","ios_money":"0.00","android_money":"999186.80","cash":"0.00","update_time":"2021-03-22 15:49:04","app_create_time":"0","is_choose_interest":"1"}
/// user_token : "V28_MTYxNzg2NzAwNmNlMWIwYjNkNjc3NDY2YWJiY2UyYmVlMjJjYjZkMGQ2NzQ5ODVmYTI="
/// bind : {"apple_id":"0","weibo":"0","qq":"0","weixin":"0","mobile":"157****8888"}
/// is_new_create_user : "0"
/// is_join : "1"
/// is_set_pwd : "1"
/// is_new_user : "0"
/// is_skip_bind : "1"
/// skip_bind_text : "为了更好的为您服务，请您绑定微信号"

class UserBean {
  User_data _userData;
  String _userToken;
  Bind _bind;
  String _isNewCreateUser;
  String _isJoin;
  String _isSetPwd;
  String _isNewUser;
  String _isSkipBind;
  String _skipBindText;

  User_data get userData => _userData;
  String get userToken => _userToken;
  Bind get bind => _bind;
  String get isNewCreateUser => _isNewCreateUser;
  String get isJoin => _isJoin;
  String get isSetPwd => _isSetPwd;
  String get isNewUser => _isNewUser;
  String get isSkipBind => _isSkipBind;
  String get skipBindText => _skipBindText;


  UserBean({
      User_data userData, 
      String userToken, 
      Bind bind, 
      String isNewCreateUser, 
      String isJoin, 
      String isSetPwd, 
      String isNewUser, 
      String isSkipBind, 
      String skipBindText}){
    _userData = userData;
    _userToken = userToken;
    _bind = bind;
    _isNewCreateUser = isNewCreateUser;
    _isJoin = isJoin;
    _isSetPwd = isSetPwd;
    _isNewUser = isNewUser;
    _isSkipBind = isSkipBind;
    _skipBindText = skipBindText;
}

  UserBean.fromJson(dynamic json) {
    _userData = json["user_data"] != null ? User_data.fromJson(json["user_data"]) : null;
    _userToken = json["user_token"];
    _bind = json["bind"] != null ? Bind.fromJson(json["bind"]) : null;
    _isNewCreateUser = json["is_new_create_user"];
    _isJoin = json["is_join"];
    _isSetPwd = json["is_set_pwd"];
    _isNewUser = json["is_new_user"];
    _isSkipBind = json["is_skip_bind"];
    _skipBindText = json["skip_bind_text"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_userData != null) {
      map["user_data"] = _userData.toJson();
    }
    map["user_token"] = _userToken;
    if (_bind != null) {
      map["bind"] = _bind.toJson();
    }
    map["is_new_create_user"] = _isNewCreateUser;
    map["is_join"] = _isJoin;
    map["is_set_pwd"] = _isSetPwd;
    map["is_new_user"] = _isNewUser;
    map["is_skip_bind"] = _isSkipBind;
    map["skip_bind_text"] = _skipBindText;
    return map;
  }

  @override
  String toString() {
    return 'UserBean{_userData: $_userData, _userToken: $_userToken, _bind: $_bind, _isNewCreateUser: $_isNewCreateUser, _isJoin: $_isJoin, _isSetPwd: $_isSetPwd, _isNewUser: $_isNewUser, _isSkipBind: $_isSkipBind, _skipBindText: $_skipBindText}';
  }
}

/// apple_id : "0"
/// weibo : "0"
/// qq : "0"
/// weixin : "0"
/// mobile : "157****8888"

class Bind {
  String _appleId;
  String _weibo;
  String _qq;
  String _weixin;
  String _mobile;

  String get appleId => _appleId;
  String get weibo => _weibo;
  String get qq => _qq;
  String get weixin => _weixin;
  String get mobile => _mobile;

  Bind({
      String appleId, 
      String weibo, 
      String qq, 
      String weixin, 
      String mobile}){
    _appleId = appleId;
    _weibo = weibo;
    _qq = qq;
    _weixin = weixin;
    _mobile = mobile;
}

  Bind.fromJson(dynamic json) {
    _appleId = json["apple_id"];
    _weibo = json["weibo"];
    _qq = json["qq"];
    _weixin = json["weixin"];
    _mobile = json["mobile"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["apple_id"] = _appleId;
    map["weibo"] = _weibo;
    map["qq"] = _qq;
    map["weixin"] = _weixin;
    map["mobile"] = _mobile;
    return map;
  }

  @override
  String toString() {
    return 'Bind{_appleId: $_appleId, _weibo: $_weibo, _qq: $_qq, _weixin: $_weixin, _mobile: $_mobile}';
  }
}

/// user_id : "90006269"
/// name : "有书~8730"
/// user_type : "0"
/// sex : "0"
/// avatar : "http://avatar.youshu.cc/ys_default.png"
/// job : ""
/// intro : ""
/// province : ""
/// city : ""
/// create_time : "2020-08-24 10:41:54"
/// rec : ""
/// xingqu : ""
/// level : "1"
/// badge_id : "0"
/// is_unlock : "1"
/// flag_old_exp : "1"
/// exp : "4350"
/// user_img : ""
/// wechat_id : ""
/// education : "0"
/// age : "0"
/// coins : "2270"
/// ios_money : "0.00"
/// android_money : "999186.80"
/// cash : "0.00"
/// update_time : "2021-03-22 15:49:04"
/// app_create_time : "0"
/// is_choose_interest : "1"

class User_data {
  String _userId;
  String _name;
  String _userType;
  String _sex;
  String _avatar;
  String _job;
  String _intro;
  String _province;
  String _city;
  String _createTime;
  String _rec;
  String _xingqu;
  String _level;
  String _badgeId;
  String _isUnlock;
  String _flagOldExp;
  String _exp;
  String _userImg;
  String _wechatId;
  String _education;
  String _age;
  String _coins;
  String _iosMoney;
  String _androidMoney;
  String _cash;
  String _updateTime;
  String _appCreateTime;
  String _isChooseInterest;

  String get userId => _userId;
  String get name => _name;
  String get userType => _userType;
  String get sex => _sex;
  String get avatar => _avatar;
  String get job => _job;
  String get intro => _intro;
  String get province => _province;
  String get city => _city;
  String get createTime => _createTime;
  String get rec => _rec;
  String get xingqu => _xingqu;
  String get level => _level;
  String get badgeId => _badgeId;
  String get isUnlock => _isUnlock;
  String get flagOldExp => _flagOldExp;
  String get exp => _exp;
  String get userImg => _userImg;
  String get wechatId => _wechatId;
  String get education => _education;
  String get age => _age;
  String get coins => _coins;
  String get iosMoney => _iosMoney;
  String get androidMoney => _androidMoney;
  String get cash => _cash;
  String get updateTime => _updateTime;
  String get appCreateTime => _appCreateTime;
  String get isChooseInterest => _isChooseInterest;

  User_data({
      String userId, 
      String name, 
      String userType, 
      String sex, 
      String avatar, 
      String job, 
      String intro, 
      String province, 
      String city, 
      String createTime, 
      String rec, 
      String xingqu, 
      String level, 
      String badgeId, 
      String isUnlock, 
      String flagOldExp, 
      String exp, 
      String userImg, 
      String wechatId, 
      String education, 
      String age, 
      String coins, 
      String iosMoney, 
      String androidMoney, 
      String cash, 
      String updateTime, 
      String appCreateTime, 
      String isChooseInterest}){
    _userId = userId;
    _name = name;
    _userType = userType;
    _sex = sex;
    _avatar = avatar;
    _job = job;
    _intro = intro;
    _province = province;
    _city = city;
    _createTime = createTime;
    _rec = rec;
    _xingqu = xingqu;
    _level = level;
    _badgeId = badgeId;
    _isUnlock = isUnlock;
    _flagOldExp = flagOldExp;
    _exp = exp;
    _userImg = userImg;
    _wechatId = wechatId;
    _education = education;
    _age = age;
    _coins = coins;
    _iosMoney = iosMoney;
    _androidMoney = androidMoney;
    _cash = cash;
    _updateTime = updateTime;
    _appCreateTime = appCreateTime;
    _isChooseInterest = isChooseInterest;
}

  User_data.fromJson(dynamic json) {
    _userId = json["user_id"];
    _name = json["name"];
    _userType = json["user_type"];
    _sex = json["sex"];
    _avatar = json["avatar"];
    _job = json["job"];
    _intro = json["intro"];
    _province = json["province"];
    _city = json["city"];
    _createTime = json["create_time"];
    _rec = json["rec"];
    _xingqu = json["xingqu"];
    _level = json["level"];
    _badgeId = json["badge_id"];
    _isUnlock = json["is_unlock"];
    _flagOldExp = json["flag_old_exp"];
    _exp = json["exp"];
    _userImg = json["user_img"];
    _wechatId = json["wechat_id"];
    _education = json["education"];
    _age = json["age"];
    _coins = json["coins"];
    _iosMoney = json["ios_money"];
    _androidMoney = json["android_money"];
    _cash = json["cash"];
    _updateTime = json["update_time"];
    _appCreateTime = json["app_create_time"];
    _isChooseInterest = json["is_choose_interest"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["user_id"] = _userId;
    map["name"] = _name;
    map["user_type"] = _userType;
    map["sex"] = _sex;
    map["avatar"] = _avatar;
    map["job"] = _job;
    map["intro"] = _intro;
    map["province"] = _province;
    map["city"] = _city;
    map["create_time"] = _createTime;
    map["rec"] = _rec;
    map["xingqu"] = _xingqu;
    map["level"] = _level;
    map["badge_id"] = _badgeId;
    map["is_unlock"] = _isUnlock;
    map["flag_old_exp"] = _flagOldExp;
    map["exp"] = _exp;
    map["user_img"] = _userImg;
    map["wechat_id"] = _wechatId;
    map["education"] = _education;
    map["age"] = _age;
    map["coins"] = _coins;
    map["ios_money"] = _iosMoney;
    map["android_money"] = _androidMoney;
    map["cash"] = _cash;
    map["update_time"] = _updateTime;
    map["app_create_time"] = _appCreateTime;
    map["is_choose_interest"] = _isChooseInterest;
    return map;
  }

  @override
  String toString() {
    return 'User_data{_userId: $_userId, _name: $_name, _userType: $_userType, _sex: $_sex, _avatar: $_avatar, _job: $_job, _intro: $_intro, _province: $_province, _city: $_city, _createTime: $_createTime, _rec: $_rec, _xingqu: $_xingqu, _level: $_level, _badgeId: $_badgeId, _isUnlock: $_isUnlock, _flagOldExp: $_flagOldExp, _exp: $_exp, _userImg: $_userImg, _wechatId: $_wechatId, _education: $_education, _age: $_age, _coins: $_coins, _iosMoney: $_iosMoney, _androidMoney: $_androidMoney, _cash: $_cash, _updateTime: $_updateTime, _appCreateTime: $_appCreateTime, _isChooseInterest: $_isChooseInterest}';
  }
}