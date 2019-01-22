import 'package:flutter/material.dart';
import 'package:msg_browser/api/models/post_list_item.dart';
import 'package:msg_browser/pages/image_viewer_page.dart';
import 'package:msg_browser/widgets/post_action_button.dart';
import 'package:pigment/pigment.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:flutter_advanced_networkimage/transition_to_image.dart';

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
    List<String> tagList = widget.post.tags.split(" ");

    return Scaffold(
      appBar: AppBar(
        title: Text("Post"),
        actions: <Widget>[
          PostActionButton(
            post: widget.post,
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Container(
              color: Pigment.fromString("#284a81"),
              height: widget.post.fileExt != "webm"
                  ? widget.post.height *
                      MediaQuery.of(context).size.width /
                      widget.post.width
                  : null,
              child: Hero(
                tag: widget.post.md5,
                child: widget.post.fileExt != "webm"
                    ? GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ImageViewerPage(
                                    post: widget.post,
                                  ),
                            ),
                          );
                        },
                        child: TransitionToImage(
                          image: AdvancedNetworkImage(
                            widget.post.fileUrl,
                            useDiskCache: true,
                          ),
                          enableRefresh: true,
                        ),
                      )
                    : Chewie(
                        _playerController,
                        placeholder: Container(
                          color: Colors.black,
                        ),
                        aspectRatio: widget.post.width / widget.post.height,
                        autoPlay: true,
                        looping: true,
                        autoInitialize: true,
                      ),
              ),
            ),
          ),
          widget.post.description.isNotEmpty
              ? Card(
                  color: Pigment.fromString("#284a81"),
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    title: Text("Description"),
                    children: <Widget>[
                      Divider(),
                      ListTile(
                        title: Text("${widget.post.description}"),
                      )
                    ],
                  ),
                )
              : Container(),
          Card(
            color: Pigment.fromString("#284a81"),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text("Tags"),
              children: <Widget>[
                ListTile(
                  subtitle: Text("$tagList"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
