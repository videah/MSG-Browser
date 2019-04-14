import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';

class E621Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("E621"),
              decoration: BoxDecoration(
                color: Pigment.fromString("#152f56"),
              ),
            ),
            ListTile(
              title: Text("About"),
            )
          ],
        ),
      ),
    );
  }
}