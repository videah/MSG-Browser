import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:msg_browser/blocs/settings_bloc.dart';
import 'package:msg_browser/pages/settings_page.dart';
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
              title: Text("Settings"),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return BlocProvider(
                        bloc: SettingsBloc(),
                        child: SettingsPage(),
                      );
                    },
                  ),
                );
              },
            ),
            AboutListTile(
              icon: Icon(Icons.info),
              applicationName: "MSG-Browser",
              applicationVersion: "0.1",
              applicationIcon: Text("🐶", style: TextStyle(fontSize: 38.0),),
              aboutBoxChildren: <Widget>[
                RichText(
                  text: TextSpan(
                    text: "Browsing app for ",
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(text: "that", style: TextStyle(fontStyle: FontStyle.italic)),
                      TextSpan(text: " image board site."),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
