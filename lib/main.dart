import 'package:flutter/material.dart';
import 'package:msg_browser/blocs/search_bloc.dart';
import 'package:msg_browser/pages/search_page.dart';
import 'package:pigment/pigment.dart';

void main() => runApp(E621App());

class E621App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SearchProvider(
      bloc: SearchBloc(),
      child: MaterialApp(
        home: SearchPage(),
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Pigment.fromString("#152f56"),
          scaffoldBackgroundColor: Pigment.fromString("#152f56"),
        )
      ),
    );
  }

}