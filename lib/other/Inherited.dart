import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InheritedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inherited"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: FrogColor(Colors.green,
            Builder(builder: (BuildContext innerContext) {
          return Text(
            "Hello Frog",
            style: GoogleFonts.fasterOne(
                textStyle: TextStyle(
                    color:
                        FrogColor.of(innerContext)?.color ?? Colors.blueAccent),
                fontSize: 36),
          );
        })),
      ),
    );
  }
}

class FrogColor extends InheritedWidget {
  final Color color;

  const FrogColor(this.color, Widget child, {Key? key})
      : super(key: key, child: child);

  static FrogColor? of(BuildContext context) {
    final FrogColor? result =
        context.dependOnInheritedWidgetOfExactType<FrogColor>();
    assert(result != null, "No FrogColor found in context");
    return result;
  }

  @override
  bool updateShouldNotify(covariant FrogColor oldWidget) {
    return color != oldWidget.color;
  }
}
