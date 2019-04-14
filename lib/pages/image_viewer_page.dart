import 'package:flutter/material.dart';
import 'package:msg_browser/api/models/post_list_item.dart';
import 'package:msg_browser/widgets/post_action_button.dart';
import 'package:msg_browser/widgets/post_content_image.dart';
import 'package:photo_view/photo_view.dart';

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
        actions: <Widget>[
          PostActionButton(
            post: post,
          )
        ],
      ),
      body: Center(
        child: PhotoView.customChild(
          childSize: Size(
            MediaQuery.of(context).size.width,
            post.height * MediaQuery.of(context).size.width / post.width,
          ),
          minScale: 1.0,
          maxScale: 8.0,
          child: PostContentImage(
            post: post,
            isViewingImage: true,
          ),
        ),
      ),
    );
  }
}
