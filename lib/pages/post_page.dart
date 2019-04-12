import 'package:flutter/material.dart';
import 'package:msg_browser/api/models/post_list_item.dart';
import 'package:msg_browser/api/models/post_tag.dart';
import 'package:msg_browser/blocs/post_bloc.dart';
import 'package:msg_browser/pages/image_viewer_page.dart';
import 'package:msg_browser/widgets/post_action_button.dart';
import 'package:msg_browser/widgets/tag_panel.dart';
import 'package:pigment/pigment.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:flutter_advanced_networkimage/provider.dart';

class PostPage extends StatefulWidget {
  final PostListItem post;

  const PostPage({Key key, this.post}) : super(key: key);

  @override
  PostPageState createState() => new PostPageState();
}

class PostPageState extends State<PostPage> {
  VideoPlayerController _playerController;
  ChewieController _chewieController;

  @override
  void initState() {
    _playerController = VideoPlayerController.network("${widget.post.fileUrl}");
    _chewieController = ChewieController(
      videoPlayerController: _playerController,
      aspectRatio: widget.post.width / widget.post.height,
      autoPlay: true,
      looping: false,
    );
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
                            widget.post.sampleUrl,
                            useDiskCache: true,
                          ),
                          enableRefresh: true,
                        ),
                      )
                    : Chewie(controller: _chewieController),
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
              title: Text("Tags"),
              children: <Widget>[
                StreamBuilder<List<PostTag>>(
                  stream: PostProvider.of(context).tags,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return TagPanel(snapshot.data);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
