import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/zoomable_widget.dart';
import 'package:flutter_advanced_networkimage/transition_to_image.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:msg_browser/api/models/post_list_item.dart';

class ImageViewerPage extends StatelessWidget {
  final PostListItem post;

  const ImageViewerPage({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Image"),
      ),
      body: Center(
        child: ZoomableWidget(
          child: Hero(
            tag: post.md5,
            child: TransitionToImage(
              image: AdvancedNetworkImage(
                post.fileUrl,
                useDiskCache: true,
              ),
            ),
          ),
          panLimit: 1.2,
          maxScale: 5.0,
          autoCenter: true,
        ),
      ),
    );
  }
}
