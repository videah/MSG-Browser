import 'package:flutter/material.dart';
import 'package:msg_browser/api/models/post_list_item.dart';

class PostPage extends StatelessWidget {

  final PostListItem post;

  const PostPage({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: post.md5,
          child: Image.network("${post.fileUrl}"),
        )
      )
    );
  }

}