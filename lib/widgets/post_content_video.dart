import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
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
    _chewieController.dispose();
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Pigment.fromString("#284a81"),
      height: widget.post.fileExt != "webm"
          ? widget.post.height *
              MediaQuery.of(context).size.width /
              widget.post.width
          : null,
      child: Hero(
        tag: widget.post.md5,
        child: Chewie(controller: _chewieController),
      ),
    );
  }
}
