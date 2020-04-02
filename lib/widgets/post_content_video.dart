import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:msg_browser/api/models/post_list_item.dart';
import 'package:pigment/pigment.dart';
import 'package:video_player/video_player.dart';

class PostContentVideo extends StatefulWidget {
  final PostListItem post;

  const PostContentVideo({Key key, this.post}) : super(key: key);

  @override
  _PostContentVideoState createState() => _PostContentVideoState();
}

class _PostContentVideoState extends State<PostContentVideo> {
  VideoPlayerController _playerController;
  ChewieController _chewieController;

  @override
  void initState() {
    _playerController = VideoPlayerController.network("${widget.post.file.url}");
    _chewieController = ChewieController(
      videoPlayerController: _playerController,
      aspectRatio: widget.post.file.width / widget.post.file.height,
      autoPlay: true,
      looping: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    _chewieController.dispose();
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = widget.post.file.height *
        MediaQuery.of(context).size.width /
        widget.post.file.width;

    return Container(
      color: Pigment.fromString("#284a81"),
      // TODO: Hero tags are broken on Chewie, put one here
      // when it gets fixed.
      child: Stack(
        children: <Widget>[
          Hero(
            tag: "${widget.post.file.md5}/thumb",
            child: TransitionToImage(
              fit: BoxFit.cover,
              enableRefresh: true,
              height: height,
              image: AdvancedNetworkImage(
                widget.post.preview.url,
                useDiskCache: true,
              ),
            ),
          ),
          Chewie(controller: _chewieController),
        ],
      ),
    );
  }
}
