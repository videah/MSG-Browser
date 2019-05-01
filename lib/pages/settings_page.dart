import 'package:flutter/material.dart';
import 'package:frideos/frideos.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:msg_browser/blocs/settings_bloc.dart';
import 'package:state_persistence/state_persistence.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<SettingsBloc>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Settings"),
      ),
      body: PersistedStateBuilder(
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();
          return ListView(
            children: <Widget>[
              CheckboxListTile(
                title: Text("IDGAF Mode"),
                activeColor: Colors.blue,
                subtitle:
                    Text("Skip post pages and go directly to image viewer"),
                onChanged: (value) {
                  setState(() => snapshot.data["idgaf"] = value);
                },
                value: snapshot.data["idgaf"] ?? false,
              ),
              ListTile(
                title: Text("Flush image cache"),
                subtitle: ValueBuilder(
                  streamed: bloc.cacheSize,
                  builder: (context, snapshot) {
                    return Text(
                      "Flushes all images from the cache (${snapshot.data} MB)",
                    );
                  },
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
          );
        },
      ),
    );
  }
}
