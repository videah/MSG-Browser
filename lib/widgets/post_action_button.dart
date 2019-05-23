import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:msg_browser/api/models/post_list_item.dart';
import 'package:url_launcher/url_launcher.dart';

class _Choice {
  final String value;
  final String text;

  const _Choice(this.value, this.text);
}

class PostActionButton extends StatelessWidget {
  final PostListItem post;
  static const List<_Choice> choices = [
    _Choice("copy_post", "Copy Post URL"),
    _Choice("copy_image", "Copy Image URL"),
    _Choice("open_in_browser", "Open In Browser"),
  ];

  const PostActionButton({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var postUrl = ClipboardData(
      text: "https://e621.net/post/show/${post.id}",
    );

    var imageUrl = ClipboardData(
      text: "${post.fileUrl}",
    );

    return PopupMenuButton<_Choice>(
      onSelected: (_Choice choice) {
        switch (choice.value) {
          case "copy_post":
            {
              Clipboard.setData(postUrl);
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: ListTile(
                    trailing: Icon(Icons.content_copy),
                    title: Text("Post URL copied to clipboard."),
                    subtitle: Text("https://e621.net/post/show/${post.id}"),
                  ),
                ),
              );
            }
            break;
          case "copy_image":
            {
              Clipboard.setData(imageUrl);
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: ListTile(
                    trailing: Icon(Icons.content_copy),
                    title: Text("Image URL copied to clipboard."),
                    subtitle: Text("${post.fileUrl}"),
                  ),
                ),
              );
            }
            break;
          case "open_in_browser":
            {
              launch("https://e621.net/post/show/${post.id}");
            }
        }
      },
      itemBuilder: (context) {
        return choices.map((_Choice choice) {
          return PopupMenuItem<_Choice>(
            value: choice,
            child: Text("${choice.text}"),
          );
        }).toList();
      },
    );
  }
}
