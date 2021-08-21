class TimeUtil {
  static String formatCommentTime(String time) {
    String formatTime = time == null ? "" : time;
    try {
      var dateTime = DateTime.parse(time);
      var currentDateTime = DateTime.now();
      var difference = currentDateTime.difference(dateTime);
      var days = difference.inDays;
      if (days == 0) {
        var minutes = difference.inMinutes;
        if (minutes < 1) {
          formatTime = "刚刚";
        } else if (minutes < 60) {
          formatTime = "$minutes分钟前";
        } else if (minutes < 60 * 24) {
          formatTime = "${difference.inHours}小时前";
        }
      } else if (days == 1) {
        formatTime = "昨天";
      } else if (days == 2) {
        formatTime = "前天";
      } else {
        var month = dateTime.month < 10 ? "0${dateTime.month}" : dateTime.month;
        var day = dateTime.day < 10 ? "0${dateTime.day}" : dateTime.day;
        if (currentDateTime.year == dateTime.year) {
          formatTime = "$month-$day";
        } else {
          formatTime = "${dateTime.year}-$month-$day";
        }
      }
    } catch (e) {
      print(e);
    }
    return formatTime;
  }
}
