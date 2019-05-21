import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:msg_browser/blocs/post_bloc.dart';

class PostHighQualityButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: BlocProvider.of<PostBloc>(context).highQuality,
      builder: (context, snapshot) {
        var color = snapshot.data == true
            ? Theme.of(context).accentColor
            : Theme.of(context).iconTheme.color;
        return IconButton(
          icon: Icon(Icons.hd),
          tooltip: "Toggle High Quality",
          color: color,
          onPressed: () {
            BlocProvider.of<PostBloc>(context).toggleHighQuality.add(true);
          },
        );
      },
    );
  }
}
