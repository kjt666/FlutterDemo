import 'package:logger/logger.dart';

class MyLoggerOutput extends ConsoleOutput{

  @override
  void output(OutputEvent event) {
    super.output(event);
    event.lines.forEach((element) {print(element);});
  }
}