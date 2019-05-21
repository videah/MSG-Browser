import 'package:flutter/material.dart';
import 'package:msg_browser/api/models/post_list_item.dart';
import 'package:msg_browser/widgets/post_action_button.dart';
import 'package:msg_browser/widgets/post_content_image.dart';
import 'package:msg_browser/widgets/post_download_button.dart';
import 'package:msg_browser/widgets/post_high_quality_button.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewerPage extends StatelessWidget {
  final PostListItem post;

  const ImageViewerPage({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = post.height * MediaQuery.of(context).size.width / post.width;
    var scale = MediaQuery.of(context).size.height / (height + 80);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        elevation: 0.0,
        title: Text("Image"),
        actions: <Widget>[
          if (post.fileExt != "webm") ...[
            PostHighQualityButton(),
          ],
          PostDownloadButton(
            post: post,
          ),
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
          initialScale: scale > 1.0 ? 1.0 : scale,
          minScale: 0.7,
          maxScale: 8.0,
          child: PostContentImage(post: post, isViewingImage: true)
        ),
      ),
    );
  }
}
