class NoteInfo {
	String _id;
	String _userId;
	String _bookId;
	String _title;
	String _content;
	List<String> _imgStr;
	String _diggCount;
	String _commentCount;
	String _readCount;
	String _isDelete;
	String _isPub;
	String _isTop;
	String _stick;
	String _isTougao;
	String _shareNoteId;
	String _shareType;
	String _pbId;
	String _noteType;
	String _bussId;
	String _length;
	String _address;
	String _createTime;
	String _updateTime;
	String _shareExt;
	String _userStick;
	String _isHandled;
	String _handleAccountId;
	String _handleTime;
	String _money;
	String _contributeNum;
	String _planId;
	String _contentType;
	String _source;
	String _isNotice;
	String _newNoteId;
	String _audioKey;
	String _headImg;
	String _audioBookId;
	String _themeBookListId;
	String _videoLen;
	String _videoSize;
	String _videoStatus;
	String _videoId;
	String _audioLen;
	String _audioSize;
	String _audioTitle;
	String _imgNative;
	String _abstract;
	String _likeNum;
	List<Img> _img;
	PreloadUser _preloadUser;
	UserData _userData;
	String _bookTitle;
	String _isDigg;
	String _isFav;
	String _isAppendImg;
	RelationData _relationData;
	String _isFollow;
	String _topicId;
	String _topicTitle;
	String _shareImg;
	String _shareJumpUrl;
	String _isShowMask;
	String _groupScheme;
	List<Null> _diggUser;
	String _noteInfoUrl;
	String _wordCount;
	String _isBuy;
	String _isSub;
	String _isSubMember;
	TopicData _topicData;

	NoteInfo({String id, String userId, String bookId, String title, String content, List<String> imgStr, String diggCount, String commentCount, String readCount, String isDelete, String isPub, String isTop, String stick, String isTougao, String shareNoteId, String shareType, String pbId, String noteType, String bussId, String length, String address, String createTime, String updateTime, String shareExt, String userStick, String isHandled, String handleAccountId, String handleTime, String money, String contributeNum, String planId, String contentType, String source, String isNotice, String newNoteId, String audioKey, String headImg, String audioBookId, String themeBookListId, String videoLen, String videoSize, String videoStatus, String videoId, String audioLen, String audioSize, String audioTitle, String imgNative, String abstract, String likeNum, List<Img> img, PreloadUser preloadUser, UserData userData, String bookTitle, String isDigg, String isFav, String isAppendImg, RelationData relationData, String isFollow, String topicId, String topicTitle, String shareImg, String shareJumpUrl, String isShowMask, String groupScheme, List<Null> diggUser, String noteInfoUrl, String wordCount, String isBuy, String isSub, String isSubMember, TopicData topicData}) {
this._id = id;
this._userId = userId;
this._bookId = bookId;
this._title = title;
this._content = content;
this._imgStr = imgStr;
this._diggCount = diggCount;
this._commentCount = commentCount;
this._readCount = readCount;
this._isDelete = isDelete;
this._isPub = isPub;
this._isTop = isTop;
this._stick = stick;
this._isTougao = isTougao;
this._shareNoteId = shareNoteId;
this._shareType = shareType;
this._pbId = pbId;
this._noteType = noteType;
this._bussId = bussId;
this._length = length;
this._address = address;
this._createTime = createTime;
this._updateTime = updateTime;
this._shareExt = shareExt;
this._userStick = userStick;
this._isHandled = isHandled;
this._handleAccountId = handleAccountId;
this._handleTime = handleTime;
this._money = money;
this._contributeNum = contributeNum;
this._planId = planId;
this._contentType = contentType;
this._source = source;
this._isNotice = isNotice;
this._newNoteId = newNoteId;
this._audioKey = audioKey;
this._headImg = headImg;
this._audioBookId = audioBookId;
this._themeBookListId = themeBookListId;
this._videoLen = videoLen;
this._videoSize = videoSize;
this._videoStatus = videoStatus;
this._videoId = videoId;
this._audioLen = audioLen;
this._audioSize = audioSize;
this._audioTitle = audioTitle;
this._imgNative = imgNative;
this._abstract = abstract;
this._likeNum = likeNum;
this._img = img;
this._preloadUser = preloadUser;
this._userData = userData;
this._bookTitle = bookTitle;
this._isDigg = isDigg;
this._isFav = isFav;
this._isAppendImg = isAppendImg;
this._relationData = relationData;
this._isFollow = isFollow;
this._topicId = topicId;
this._topicTitle = topicTitle;
this._shareImg = shareImg;
this._shareJumpUrl = shareJumpUrl;
this._isShowMask = isShowMask;
this._groupScheme = groupScheme;
this._diggUser = diggUser;
this._noteInfoUrl = noteInfoUrl;
this._wordCount = wordCount;
this._isBuy = isBuy;
this._isSub = isSub;
this._isSubMember = isSubMember;
this._topicData = topicData;
}

	String get id => _id;
	set id(String id) => _id = id;
	String get userId => _userId;
	set userId(String userId) => _userId = userId;
	String get bookId => _bookId;
	set bookId(String bookId) => _bookId = bookId;
	String get title => _title;
	set title(String title) => _title = title;
	String get content => _content;
	set content(String content) => _content = content;
	List<String> get imgStr => _imgStr;
	set imgStr(List<String> imgStr) => _imgStr = imgStr;
	String get diggCount => _diggCount;
	set diggCount(String diggCount) => _diggCount = diggCount;
	String get commentCount => _commentCount;
	set commentCount(String commentCount) => _commentCount = commentCount;
	String get readCount => _readCount;
	set readCount(String readCount) => _readCount = readCount;
	String get isDelete => _isDelete;
	set isDelete(String isDelete) => _isDelete = isDelete;
	String get isPub => _isPub;
	set isPub(String isPub) => _isPub = isPub;
	String get isTop => _isTop;
	set isTop(String isTop) => _isTop = isTop;
	String get stick => _stick;
	set stick(String stick) => _stick = stick;
	String get isTougao => _isTougao;
	set isTougao(String isTougao) => _isTougao = isTougao;
	String get shareNoteId => _shareNoteId;
	set shareNoteId(String shareNoteId) => _shareNoteId = shareNoteId;
	String get shareType => _shareType;
	set shareType(String shareType) => _shareType = shareType;
	String get pbId => _pbId;
	set pbId(String pbId) => _pbId = pbId;
	String get noteType => _noteType;
	set noteType(String noteType) => _noteType = noteType;
	String get bussId => _bussId;
	set bussId(String bussId) => _bussId = bussId;
	String get length => _length;
	set length(String length) => _length = length;
	String get address => _address;
	set address(String address) => _address = address;
	String get createTime => _createTime;
	set createTime(String createTime) => _createTime = createTime;
	String get updateTime => _updateTime;
	set updateTime(String updateTime) => _updateTime = updateTime;
	String get shareExt => _shareExt;
	set shareExt(String shareExt) => _shareExt = shareExt;
	String get userStick => _userStick;
	set userStick(String userStick) => _userStick = userStick;
	String get isHandled => _isHandled;
	set isHandled(String isHandled) => _isHandled = isHandled;
	String get handleAccountId => _handleAccountId;
	set handleAccountId(String handleAccountId) => _handleAccountId = handleAccountId;
	String get handleTime => _handleTime;
	set handleTime(String handleTime) => _handleTime = handleTime;
	String get money => _money;
	set money(String money) => _money = money;
	String get contributeNum => _contributeNum;
	set contributeNum(String contributeNum) => _contributeNum = contributeNum;
	String get planId => _planId;
	set planId(String planId) => _planId = planId;
	String get contentType => _contentType;
	set contentType(String contentType) => _contentType = contentType;
	String get source => _source;
	set source(String source) => _source = source;
	String get isNotice => _isNotice;
	set isNotice(String isNotice) => _isNotice = isNotice;
	String get newNoteId => _newNoteId;
	set newNoteId(String newNoteId) => _newNoteId = newNoteId;
	String get audioKey => _audioKey;
	set audioKey(String audioKey) => _audioKey = audioKey;
	String get headImg => _headImg;
	set headImg(String headImg) => _headImg = headImg;
	String get audioBookId => _audioBookId;
	set audioBookId(String audioBookId) => _audioBookId = audioBookId;
	String get themeBookListId => _themeBookListId;
	set themeBookListId(String themeBookListId) => _themeBookListId = themeBookListId;
	String get videoLen => _videoLen;
	set videoLen(String videoLen) => _videoLen = videoLen;
	String get videoSize => _videoSize;
	set videoSize(String videoSize) => _videoSize = videoSize;
	String get videoStatus => _videoStatus;
	set videoStatus(String videoStatus) => _videoStatus = videoStatus;
	String get videoId => _videoId;
	set videoId(String videoId) => _videoId = videoId;
	String get audioLen => _audioLen;
	set audioLen(String audioLen) => _audioLen = audioLen;
	String get audioSize => _audioSize;
	set audioSize(String audioSize) => _audioSize = audioSize;
	String get audioTitle => _audioTitle;
	set audioTitle(String audioTitle) => _audioTitle = audioTitle;
	String get imgNative => _imgNative;
	set imgNative(String imgNative) => _imgNative = imgNative;
	String get abstract => _abstract;
	set abstract(String abstract) => _abstract = abstract;
	String get likeNum => _likeNum;
	set likeNum(String likeNum) => _likeNum = likeNum;
	List<Img> get img => _img;
	set img(List<Img> img) => _img = img;
	PreloadUser get preloadUser => _preloadUser;
	set preloadUser(PreloadUser preloadUser) => _preloadUser = preloadUser;
	UserData get userData => _userData;
	set userData(UserData userData) => _userData = userData;
	String get bookTitle => _bookTitle;
	set bookTitle(String bookTitle) => _bookTitle = bookTitle;
	String get isDigg => _isDigg;
	set isDigg(String isDigg) => _isDigg = isDigg;
	String get isFav => _isFav;
	set isFav(String isFav) => _isFav = isFav;
	String get isAppendImg => _isAppendImg;
	set isAppendImg(String isAppendImg) => _isAppendImg = isAppendImg;
	RelationData get relationData => _relationData;
	set relationData(RelationData relationData) => _relationData = relationData;
	String get isFollow => _isFollow;
	set isFollow(String isFollow) => _isFollow = isFollow;
	String get topicId => _topicId;
	set topicId(String topicId) => _topicId = topicId;
	String get topicTitle => _topicTitle;
	set topicTitle(String topicTitle) => _topicTitle = topicTitle;
	String get shareImg => _shareImg;
	set shareImg(String shareImg) => _shareImg = shareImg;
	String get shareJumpUrl => _shareJumpUrl;
	set shareJumpUrl(String shareJumpUrl) => _shareJumpUrl = shareJumpUrl;
	String get isShowMask => _isShowMask;
	set isShowMask(String isShowMask) => _isShowMask = isShowMask;
	String get groupScheme => _groupScheme;
	set groupScheme(String groupScheme) => _groupScheme = groupScheme;
	List<Null> get diggUser => _diggUser;
	set diggUser(List<Null> diggUser) => _diggUser = diggUser;
	String get noteInfoUrl => _noteInfoUrl;
	set noteInfoUrl(String noteInfoUrl) => _noteInfoUrl = noteInfoUrl;
	String get wordCount => _wordCount;
	set wordCount(String wordCount) => _wordCount = wordCount;
	String get isBuy => _isBuy;
	set isBuy(String isBuy) => _isBuy = isBuy;
	String get isSub => _isSub;
	set isSub(String isSub) => _isSub = isSub;
	String get isSubMember => _isSubMember;
	set isSubMember(String isSubMember) => _isSubMember = isSubMember;
	TopicData get topicData => _topicData;
	set topicData(TopicData topicData) => _topicData = topicData;

	NoteInfo.fromJson(Map<String, dynamic> json) {
		_id = json['id'];
		_userId = json['user_id'];
		_bookId = json['book_id'];
		_title = json['title'];
		_content = json['content'];
		_imgStr = json['img_str'].cast<String>();
		_diggCount = json['digg_count'];
		_commentCount = json['comment_count'];
		_readCount = json['read_count'];
		_isDelete = json['is_delete'];
		_isPub = json['is_pub'];
		_isTop = json['is_top'];
		_stick = json['stick'];
		_isTougao = json['is_tougao'];
		_shareNoteId = json['share_note_id'];
		_shareType = json['share_type'];
		_pbId = json['pb_id'];
		_noteType = json['note_type'];
		_bussId = json['buss_id'];
		_length = json['length'];
		_address = json['address'];
		_createTime = json['create_time'];
		_updateTime = json['update_time'];
		_shareExt = json['share_ext'];
		_userStick = json['user_stick'];
		_isHandled = json['is_handled'];
		_handleAccountId = json['handle_account_id'];
		_handleTime = json['handle_time'];
		_money = json['money'];
		_contributeNum = json['contribute_num'];
		_planId = json['plan_id'];
		_contentType = json['content_type'];
		_source = json['source'];
		_isNotice = json['is_notice'];
		_newNoteId = json['new_note_id'];
		_audioKey = json['audio_key'];
		_headImg = json['head_img'];
		_audioBookId = json['audio_book_id'];
		_themeBookListId = json['theme_book_list_id'];
		_videoLen = json['video_len'];
		_videoSize = json['video_size'];
		_videoStatus = json['video_status'];
		_videoId = json['video_id'];
		_audioLen = json['audio_len'];
		_audioSize = json['audio_size'];
		_audioTitle = json['audio_title'];
		_imgNative = json['img_native'];
		_abstract = json['abstract'];
		_likeNum = json['like_num'];
		if (json['img'] != null) {
			_img = new List<Img>();
			json['img'].forEach((v) { _img.add(new Img.fromJson(v)); });
		}
		_preloadUser = json['preload_user'] != null ? new PreloadUser.fromJson(json['preload_user']) : null;
		_userData = json['user_data'] != null ? new UserData.fromJson(json['user_data']) : null;
		_bookTitle = json['book_title'];
		_isDigg = json['is_digg'];
		_isFav = json['is_fav'];
		_isAppendImg = json['is_append_img'];
		_relationData = json['relation_data'] != null ? new RelationData.fromJson(json['relation_data']) : null;
		_isFollow = json['is_follow'];
		_topicId = json['topic_id'];
		_topicTitle = json['topic_title'];
		_shareImg = json['share_img'];
		_shareJumpUrl = json['share_jump_url'];
		_isShowMask = json['is_show_mask'];
		_groupScheme = json['group_scheme'];
		/*if (json['digg_user'] != null) {
			_diggUser = new List<Null>();
			json['digg_user'].forEach((v) { _diggUser.add(new Null.fromJson(v)); });
		}*/
		_noteInfoUrl = json['note_info_url'];
		_wordCount = json['word_count'];
		_isBuy = json['is_buy'];
		_isSub = json['is_sub'];
		_isSubMember = json['is_sub_member'];
		_topicData = json['topic_data'] != null ? new TopicData.fromJson(json['topic_data']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this._id;
		data['user_id'] = this._userId;
		data['book_id'] = this._bookId;
		data['title'] = this._title;
		data['content'] = this._content;
		data['img_str'] = this._imgStr;
		data['digg_count'] = this._diggCount;
		data['comment_count'] = this._commentCount;
		data['read_count'] = this._readCount;
		data['is_delete'] = this._isDelete;
		data['is_pub'] = this._isPub;
		data['is_top'] = this._isTop;
		data['stick'] = this._stick;
		data['is_tougao'] = this._isTougao;
		data['share_note_id'] = this._shareNoteId;
		data['share_type'] = this._shareType;
		data['pb_id'] = this._pbId;
		data['note_type'] = this._noteType;
		data['buss_id'] = this._bussId;
		data['length'] = this._length;
		data['address'] = this._address;
		data['create_time'] = this._createTime;
		data['update_time'] = this._updateTime;
		data['share_ext'] = this._shareExt;
		data['user_stick'] = this._userStick;
		data['is_handled'] = this._isHandled;
		data['handle_account_id'] = this._handleAccountId;
		data['handle_time'] = this._handleTime;
		data['money'] = this._money;
		data['contribute_num'] = this._contributeNum;
		data['plan_id'] = this._planId;
		data['content_type'] = this._contentType;
		data['source'] = this._source;
		data['is_notice'] = this._isNotice;
		data['new_note_id'] = this._newNoteId;
		data['audio_key'] = this._audioKey;
		data['head_img'] = this._headImg;
		data['audio_book_id'] = this._audioBookId;
		data['theme_book_list_id'] = this._themeBookListId;
		data['video_len'] = this._videoLen;
		data['video_size'] = this._videoSize;
		data['video_status'] = this._videoStatus;
		data['video_id'] = this._videoId;
		data['audio_len'] = this._audioLen;
		data['audio_size'] = this._audioSize;
		data['audio_title'] = this._audioTitle;
		data['img_native'] = this._imgNative;
		data['abstract'] = this._abstract;
		data['like_num'] = this._likeNum;
		if (this._img != null) {
      data['img'] = this._img.map((v) => v.toJson()).toList();
    }
		if (this._preloadUser != null) {
      data['preload_user'] = this._preloadUser.toJson();
    }
		if (this._userData != null) {
      data['user_data'] = this._userData.toJson();
    }
		data['book_title'] = this._bookTitle;
		data['is_digg'] = this._isDigg;
		data['is_fav'] = this._isFav;
		data['is_append_img'] = this._isAppendImg;
		if (this._relationData != null) {
      data['relation_data'] = this._relationData.toJson();
    }
		data['is_follow'] = this._isFollow;
		data['topic_id'] = this._topicId;
		data['topic_title'] = this._topicTitle;
		data['share_img'] = this._shareImg;
		data['share_jump_url'] = this._shareJumpUrl;
		data['is_show_mask'] = this._isShowMask;
		data['group_scheme'] = this._groupScheme;
		/*if (this._diggUser != null) {
      data['digg_user'] = this._diggUser.map((v) => v.toJson()).toList();
    }*/
		data['note_info_url'] = this._noteInfoUrl;
		data['word_count'] = this._wordCount;
		data['is_buy'] = this._isBuy;
		data['is_sub'] = this._isSub;
		data['is_sub_member'] = this._isSubMember;
		if (this._topicData != null) {
      data['topic_data'] = this._topicData.toJson();
    }
		return data;
	}
}

class Img {
	String _large;
	String _small;

	Img({String large, String small}) {
this._large = large;
this._small = small;
}

	String get large => _large;
	set large(String large) => _large = large;
	String get small => _small;
	set small(String small) => _small = small;

	Img.fromJson(Map<String, dynamic> json) {
		_large = json['large'];
		_small = json['small'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['large'] = this._large;
		data['small'] = this._small;
		return data;
	}
}

class PreloadUser {
	Data _data;

	PreloadUser({Data data}) {
this._data = data;
}

	Data get data => _data;
	set data(Data data) => _data = data;

	PreloadUser.fromJson(Map<String, dynamic> json) {
		_data = json['data'] != null ? new Data.fromJson(json['data']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this._data != null) {
      data['data'] = this._data.toJson();
    }
		return data;
	}
}

class Data {
	PageInfo _pageInfo;

	Data({PageInfo pageInfo}) {
this._pageInfo = pageInfo;
}

	PageInfo get pageInfo => _pageInfo;
	set pageInfo(PageInfo pageInfo) => _pageInfo = pageInfo;

	Data.fromJson(Map<String, dynamic> json) {
		_pageInfo = json['pageInfo'] != null ? new PageInfo.fromJson(json['pageInfo']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this._pageInfo != null) {
      data['pageInfo'] = this._pageInfo.toJson();
    }
		return data;
	}
}

class PageInfo {
	User _user;

	PageInfo({User user}) {
this._user = user;
}

	User get user => _user;
	set user(User user) => _user = user;

	PageInfo.fromJson(Map<String, dynamic> json) {
		_user = json['user'] != null ? new User.fromJson(json['user']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this._user != null) {
      data['user'] = this._user.toJson();
    }
		return data;
	}
}

class User {
	String _levelName;
	String _joinDays;
	String _level;
	String _userId;
	String _name;
	String _userType;
	String _avatar;
	String _intro;
	String _fansCount;
	String _followCount;

	User({String levelName, String joinDays, String level, String userId, String name, String userType, String avatar, String intro, String fansCount, String followCount}) {
this._levelName = levelName;
this._joinDays = joinDays;
this._level = level;
this._userId = userId;
this._name = name;
this._userType = userType;
this._avatar = avatar;
this._intro = intro;
this._fansCount = fansCount;
this._followCount = followCount;
}

	String get levelName => _levelName;
	set levelName(String levelName) => _levelName = levelName;
	String get joinDays => _joinDays;
	set joinDays(String joinDays) => _joinDays = joinDays;
	String get level => _level;
	set level(String level) => _level = level;
	String get userId => _userId;
	set userId(String userId) => _userId = userId;
	String get name => _name;
	set name(String name) => _name = name;
	String get userType => _userType;
	set userType(String userType) => _userType = userType;
	String get avatar => _avatar;
	set avatar(String avatar) => _avatar = avatar;
	String get intro => _intro;
	set intro(String intro) => _intro = intro;
	String get fansCount => _fansCount;
	set fansCount(String fansCount) => _fansCount = fansCount;
	String get followCount => _followCount;
	set followCount(String followCount) => _followCount = followCount;

	User.fromJson(Map<String, dynamic> json) {
		_levelName = json['level_name'];
		_joinDays = json['join_days'];
		_level = json['level'];
		_userId = json['user_id'];
		_name = json['name'];
		_userType = json['user_type'];
		_avatar = json['avatar'];
		_intro = json['intro'];
		_fansCount = json['fans_count'];
		_followCount = json['follow_count'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['level_name'] = this._levelName;
		data['join_days'] = this._joinDays;
		data['level'] = this._level;
		data['user_id'] = this._userId;
		data['name'] = this._name;
		data['user_type'] = this._userType;
		data['avatar'] = this._avatar;
		data['intro'] = this._intro;
		data['fans_count'] = this._fansCount;
		data['follow_count'] = this._followCount;
		return data;
	}
}

class UserData {
	String _userId;
	String _name;
	String _sex;
	String _level;
	String _avatar;
	String _badgeId;
	String _intro;
	String _userType;
	String _fansCount;
	String _followCount;
	String _authIcon;
	String _isVip;
	String _authTitle;

	UserData({String userId, String name, String sex, String level, String avatar, String badgeId, String intro, String userType, String fansCount, String followCount,  String authIcon, String isVip, String authTitle}) {
this._userId = userId;
this._name = name;
this._sex = sex;
this._level = level;
this._avatar = avatar;
this._badgeId = badgeId;
this._intro = intro;
this._userType = userType;
this._fansCount = fansCount;
this._followCount = followCount;
this._authIcon = authIcon;
this._isVip = isVip;
this._authTitle = authTitle;
}

	String get userId => _userId;
	set userId(String userId) => _userId = userId;
	String get name => _name;
	set name(String name) => _name = name;
	String get sex => _sex;
	set sex(String sex) => _sex = sex;
	String get level => _level;
	set level(String level) => _level = level;
	String get avatar => _avatar;
	set avatar(String avatar) => _avatar = avatar;
	String get badgeId => _badgeId;
	set badgeId(String badgeId) => _badgeId = badgeId;
	String get intro => _intro;
	set intro(String intro) => _intro = intro;
	String get userType => _userType;
	set userType(String userType) => _userType = userType;
	String get fansCount => _fansCount;
	set fansCount(String fansCount) => _fansCount = fansCount;
	String get followCount => _followCount;
	set followCount(String followCount) => _followCount = followCount;
	String get authIcon => _authIcon;
	set authIcon(String authIcon) => _authIcon = authIcon;
	String get isVip => _isVip;
	set isVip(String isVip) => _isVip = isVip;
	String get authTitle => _authTitle;
	set authTitle(String authTitle) => _authTitle = authTitle;

	UserData.fromJson(Map<String, dynamic> json) {
		_userId = json['user_id'];
		_name = json['name'];
		_sex = json['sex'];
		_level = json['level'];
		_avatar = json['avatar'];
		_badgeId = json['badge_id'];
		_intro = json['intro'];
		_userType = json['user_type'];
		_fansCount = json['fans_count'];
		_followCount = json['follow_count'];
		_authIcon = json['auth_icon'];
		_isVip = json['is_vip'];
		_authTitle = json['auth_title'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['user_id'] = this._userId;
		data['name'] = this._name;
		data['sex'] = this._sex;
		data['level'] = this._level;
		data['avatar'] = this._avatar;
		data['badge_id'] = this._badgeId;
		data['intro'] = this._intro;
		data['user_type'] = this._userType;
		data['fans_count'] = this._fansCount;
		data['follow_count'] = this._followCount;
		data['auth_icon'] = this._authIcon;
		data['is_vip'] = this._isVip;
		data['auth_title'] = this._authTitle;
		return data;
	}
}

class RelationData {
	String _itemType;
	int _itemValue;
	String _title;
	String _relationTitle;
	String _relationCover;
	String _author;
	String _scheme;
	String _relationStatus;

	RelationData({String itemType, int itemValue, String title, String relationTitle, String relationCover, String author, String scheme, String relationStatus}) {
this._itemType = itemType;
this._itemValue = itemValue;
this._title = title;
this._relationTitle = relationTitle;
this._relationCover = relationCover;
this._author = author;
this._scheme = scheme;
this._relationStatus = relationStatus;
}

	String get itemType => _itemType;
	set itemType(String itemType) => _itemType = itemType;
	int get itemValue => _itemValue;
	set itemValue(int itemValue) => _itemValue = itemValue;
	String get title => _title;
	set title(String title) => _title = title;
	String get relationTitle => _relationTitle;
	set relationTitle(String relationTitle) => _relationTitle = relationTitle;
	String get relationCover => _relationCover;
	set relationCover(String relationCover) => _relationCover = relationCover;
	String get author => _author;
	set author(String author) => _author = author;
	String get scheme => _scheme;
	set scheme(String scheme) => _scheme = scheme;
	String get relationStatus => _relationStatus;
	set relationStatus(String relationStatus) => _relationStatus = relationStatus;

	RelationData.fromJson(Map<String, dynamic> json) {
		_itemType = json['item_type'];
		_itemValue = json['item_value'];
		_title = json['title'];
		_relationTitle = json['relation_title'];
		_relationCover = json['relation_cover'];
		_author = json['author'];
		_scheme = json['scheme'];
		_relationStatus = json['relation_status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['item_type'] = this._itemType;
		data['item_value'] = this._itemValue;
		data['title'] = this._title;
		data['relation_title'] = this._relationTitle;
		data['relation_cover'] = this._relationCover;
		data['author'] = this._author;
		data['scheme'] = this._scheme;
		data['relation_status'] = this._relationStatus;
		return data;
	}
}

class TopicData {
	String _noteId;
	String _topicId;
	String _topicTitle;

	TopicData({String noteId, String topicId, String topicTitle}) {
this._noteId = noteId;
this._topicId = topicId;
this._topicTitle = topicTitle;
}

	String get noteId => _noteId;
	set noteId(String noteId) => _noteId = noteId;
	String get topicId => _topicId;
	set topicId(String topicId) => _topicId = topicId;
	String get topicTitle => _topicTitle;
	set topicTitle(String topicTitle) => _topicTitle = topicTitle;

	TopicData.fromJson(Map<String, dynamic> json) {
		_noteId = json['note_id'];
		_topicId = json['topic_id'];
		_topicTitle = json['topic_title'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['note_id'] = this._noteId;
		data['topic_id'] = this._topicId;
		data['topic_title'] = this._topicTitle;
		return data;
	}
}
