import 'package:flutter/material.dart';
import 'package:msg_browser/api/models/post_list_item.dart';
import 'package:pigment/pigment.dart';

class ImageTile extends StatelessWidget {
  final PostListItem post;

  const ImageTile({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _ratingColor = post.rating == "e"
        ? Pigment.fromString("#e45f5f")
        : post.rating == "q" ? Pigment.fromString("#e4e150") : Colors.white;

    Color _scoreColor = post.score > 0
        ? Pigment.fromString("#3e9e49")
        : post.score < 0 ? Pigment.fromString("#e45f5f") : Colors.white;

    Color _borderColor = post.hasChildren ? Pigment.fromString("#0f0") : post.parentId != null ? Pigment.fromString("#cc0") : Pigment.fromString("#284a81");

    return Card(
      color: _borderColor,
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: 175.0,
                child: Image.network("${post.previewUrl}", fit: BoxFit.cover),
              ),
            )
          ),
          Container(
            color: Pigment.fromString("#284a81"),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      post.score > 0 ? Icon(Icons.arrow_upward, size: 14.0, color: _scoreColor,) : post.score < 0 ? Icon(Icons.arrow_downward, size: 14.0, color: _scoreColor,) : Icon(Icons.linear_scale, size: 14.0, color: _scoreColor,),
                      Text(
                        " ${post.score}",
                        style: TextStyle(color: _scoreColor),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.favorite, size: 14.0,),
                      Text(" ${post.favCount}"),
                    ],
                  ),
                  Text("C0"),
                  Text(
                    "${post.rating.toUpperCase()}",
                    style: TextStyle(color: _ratingColor),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
