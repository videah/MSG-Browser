import 'package:flutter/material.dart';
import 'package:msg_browser/api/models/post_list_item.dart';
import 'package:pigment/pigment.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

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
              height: post.fileExt != "webm"
                  ? post.height * MediaQuery.of(context).size.width / post.width
                  : null,
              child: post.fileExt != "webm"
                  ? Image.network("${post.fileUrl}")
                  : Chewie(
                      VideoPlayerController.network("${post.fileUrl}"),
                      placeholder: Container(
                        color: Colors.black,
                      ),
                      aspectRatio: 0.75, // TODO: calculate correct ratio
                      autoPlay: true,
                      looping: true,
                    ),
            ),
            post.description.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      color: Pigment.fromString("#284a81"),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(16.0),
                        title: Text("Description"),
                        subtitle: Text("${post.description}"),
                      ),
                    ),
                  )
                : Container(),
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
        ));
  }
}
