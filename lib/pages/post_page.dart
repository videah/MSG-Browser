import 'package:flutter/material.dart';
import 'package:msg_browser/api/models/post_list_item.dart';
import 'package:pigment/pigment.dart';

class PostPage extends StatelessWidget {

  final PostListItem post;

  const PostPage({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Pigment.fromString("#284a81"),
            height:  post.height * MediaQuery.of(context).size.width / post.width,
            child: Hero(
              tag: post.md5,
              child: Image.network("${post.fileUrl}"),
            ),
          ),
          post.description.isNotEmpty ? Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              color: Pigment.fromString("#284a81"),
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                title: Text("Description"),
                subtitle: Text("${post.description} ${post.width}, ${post.height} \n ${MediaQuery.of(context).size}"),
              ),
            ),
          ) : Container(),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              color: Pigment.fromString("#284a81"),
              child: ExpansionTile(
                initiallyExpanded: true,
                trailing: Icon(Icons.tag_faces),
                title: Text("Tags"),
                children: <Widget>[
                  ListTile(
                    subtitle: Text("${post.tags}"),
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }

}