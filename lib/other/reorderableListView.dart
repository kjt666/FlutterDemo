import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReorderableListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ReorderableListViewPage();
  }
}

class _ReorderableListViewPage extends State<ReorderableListViewPage> {
  late List<int> _items;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _items = List.generate(100000, (index) => index);
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    return Scaffold(
      appBar: AppBar(
        title: Text("ReorderableListView"),
      ),
      body: ReorderableListView(
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final int item = _items.removeAt(oldIndex);
            _items.insert(newIndex, item);
          });
        },
        header: Padding(
            padding: EdgeInsets.all(10),
            child: Text("This is the header!",
                style: TextStyle(color: Colors.redAccent, fontSize: 16))),
        children: [
          for (final item in _items)
            ListTile(
              // tileColor: item.isOdd?oddItemColor:evenItemColor,
              key: ValueKey(item),
              title: Text("Item #$item"),
            )
        ],
      ),
    );
  }
}
