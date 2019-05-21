import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:msg_browser/blocs/post_bloc.dart';

class PostHighQualityButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.hd),
      tooltip: "Toggle HD Version",
      onPressed: () {
        BlocProvider.of<PostBloc>(context).toggleHighQuality.add(true);
      },
    );
  }
}