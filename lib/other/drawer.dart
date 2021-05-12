import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer"),
      ),
      drawerEdgeDragWidth: 50,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Text(
                  "Hi,MF\nWelcome to Drawer!",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.redAccent,
                      fontStyle: FontStyle.italic,
                      /*letterSpacing: 1,*/
                      height: 1.5),
                ),
              ),
            ),
            ListTile(
              title: Text("aaa"),
              leading: Icon(Icons.favorite),
              onTap: () {
                // Scaffold.of(context).showSnackBar(snackbar)
                Navigator.of(context).pop(false);
                /*SnackBar.of(context)
                    .showSnackBar(SnackBar(content: Text("aaa")));*/
              },
            ),
            ListTile(
              title: Text("bbb"),
              leading: Icon(Icons.favorite),
            ),
            ListTile(
              title: Text("ccc"),
              leading: Icon(Icons.favorite),
            )
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Text(
                  "Hi,MF\nWelcome to Drawer!",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.redAccent,
                      fontStyle: FontStyle.italic,
                      /*letterSpacing: 1,*/
                      height: 1.5),
                ),
              ),
            ),
            ListTile(
              title: Text("aaa"),
              leading: Icon(Icons.favorite),
              onTap: () {
                // Scaffold.of(context).showSnackBar(snackbar)
                Navigator.of(context).pop(false);
                /*ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("aaa")));*/
              },
            ),
            ListTile(
              title: Text("bbb"),
              leading: Icon(Icons.favorite),
            ),
            ListTile(
              title: Text("ccc"),
              leading: Icon(Icons.favorite),
            )
          ],
        ),
      ),
      body: Container(),
    );
  }
}
