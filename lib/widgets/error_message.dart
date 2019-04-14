import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {

  final String error;

  const ErrorMessage({Key key, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RotatedBox(
            quarterTurns: 1,
            child: Text(
              ":(",
              style: TextStyle(fontSize: 80.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text("$error"),
          )
        ],
      ),
    );
  }
}