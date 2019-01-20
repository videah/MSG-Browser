import 'package:flutter/material.dart';
import 'package:msg_browser/api/models/post_list_item.dart';
import 'package:pigment/pigment.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class PostPage extends StatefulWidget {
  final PostListItem post;

  const PostPage({Key key, this.post}) : super(key: key);

  @override
  PostPageState createState() => new PostPageState();
}

class PostPageState extends State<PostPage> {

  VideoPlayerController _playerController;

  @override
  void initState() {
    _playerController = VideoPlayerController.network("${widget.post.fileUrl}");
    super.initState();
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }

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
                height: widget.post.fileExt != "webm"
                    ? widget.post.height *
                        MediaQuery.of(context).size.width /
                        widget.post.width
                    : null,
                child: Hero(
                  tag: widget.post.md5,
                  child: widget.post.fileExt != "webm"
                      ? Image.network("${widget.post.fileUrl}")
                      : Chewie(
                          _playerController,
                          placeholder: Container(
                            color: Colors.black,
                          ),
                          aspectRatio: 0.75, // TODO: calculate correct ratio
                          autoPlay: true,
                          looping: true,
                        ),
                )),
            widget.post.description.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      color: Pigment.fromString("#284a81"),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(16.0),
                        title: Text("Description"),
                        subtitle: Text("${widget.post.description}"),
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
                      subtitle: Text("${widget.post.tags}"),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
