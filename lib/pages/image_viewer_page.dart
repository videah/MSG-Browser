import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:msg_browser/api/models/post_list_item.dart';
import 'package:msg_browser/widgets/post_action_button.dart';
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
          child: Hero(
            tag: post.md5,
            child: TransitionToImage(
              fit: BoxFit.cover,
              enableRefresh: true,
              image: AdvancedNetworkImage(
                post.sampleUrl,
                useDiskCache: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
