import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:msg_browser/api/models/post_list_item.dart';
import 'package:pigment/pigment.dart';

class PostContentImage extends StatelessWidget {
  final PostListItem post;

  const PostContentImage({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = post.height * MediaQuery.of(context).size.width / post.width;
    return Container(
      color: Pigment.fromString("#284a81"),
      height: post.height * MediaQuery.of(context).size.width / post.width,
      child: Hero(
        tag: post.md5,
        child: Stack(
          children: <Widget>[
            TransitionToImage(
              fit: BoxFit.cover,
              height: height,
              enableRefresh: true,
              image: AdvancedNetworkImage(
                post.previewUrl,
                useDiskCache: true,
              ),
            ),
            TransitionToImage(
              fit: BoxFit.fitWidth,
              height: height,
              enableRefresh: true,
              image: AdvancedNetworkImage(
                post.sampleUrl,
                useDiskCache: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
