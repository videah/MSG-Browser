import 'package:flutter/material.dart';
import 'package:frideos/frideos.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:msg_browser/blocs/settings_bloc.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<SettingsBloc>(context);
    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Flush image cache"),
              subtitle: ValueBuilder(
                streamed: bloc.cacheSize,
                builder: (context, snapshot) => Text("Flushes all images from the cache (${snapshot.data} Mb)"),
              ),
              leading: Icon(
                Icons.cached,
                size: 48.0,
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Warning"),
                      content: Text(
                        "Are you sure you want to clear the image cache? This cannot be undone.",
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("CANCEL"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text("CLEAR"),
                          onPressed: () {
                            bloc.clearCache();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            )
          ],
        ));
  }
}
