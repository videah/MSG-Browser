import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:msg_browser/blocs/search_bloc.dart';
import 'package:msg_browser/pages/home_page.dart';
import 'package:state_persistence/state_persistence.dart';
import 'package:pigment/pigment.dart';

void main() => runApp(E621App());

class E621App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PersistedAppState(
      storage: JsonFileStorage(),
      child: BlocProvider(
        bloc: SearchBloc(),
        child: MaterialApp(
          title: "SeaSalt",
          home: HomePage(),
          theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Pigment.fromString("#012e57"),
            scaffoldBackgroundColor: Pigment.fromString("#012e57"),
            canvasColor: Pigment.fromString("#012e57"),
          ),
        ),
      ),
    );
  }
}
