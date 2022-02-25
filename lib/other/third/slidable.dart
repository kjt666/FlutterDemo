import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidablePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SlidableState();
  }
}

class SlidableState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slidable"),
      ),
      body: Container(
        child: Slidable(
          key: const ValueKey(0),
          startActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (_) {},
                backgroundColor: Color(0xFF7BC043),
                foregroundColor: Colors.white,
                icon: Icons.archive,
                label: '收藏',
              ),
              SlidableAction(
                onPressed: (_) {},
                backgroundColor: Color(0xFF0392CF),
                foregroundColor: Colors.white,
                icon: Icons.save,
                label: '保存',
              ),
              CustomSlidableAction(
                  onPressed: (_) {},
                  backgroundColor: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '举报',
                        style: TextStyle(color: Colors.white, fontSize: 12,),
                      ),
                    ],
                  ))
            ],
          ),
          endActionPane: ActionPane(
            motion: BehindMotion(),
            children: [
              SlidableAction(
                onPressed: (_) {},
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: '删除',
                spacing: 5,
              )
            ],
          ),
          child: ListTile(
            title: Text('Slide me'),
            tileColor: Colors.amberAccent,
          ),
        ),
      ),
    );
  }
}
