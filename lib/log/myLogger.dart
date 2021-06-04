import 'package:flutter_app/util/methodChannelUtil.dart';
import 'package:logger/logger.dart';

class MyLogger extends Logger {
  final LogPrinter printer = PrettyPrinter();

  @override
  void log(Level level, dynamic message,
      [dynamic error, StackTrace stackTrace]) {
    super.log(level, message, error, stackTrace);
    print("$level,$message,$error,$stackTrace");
    var logEvent = LogEvent(level, message, error, stackTrace);
    var list = printer.log(logEvent);
    MethodChannelUtil.nativeChannel.invokeMethod("logger",
        {'level': level.toString(), 'message': message.toString(), 'error': error.toString(), 'data': list});
  }
}
