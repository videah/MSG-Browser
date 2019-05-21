import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:msg_browser/api/models/post_list_item.dart';
import 'package:msg_browser/blocs/post_bloc.dart';
import 'package:msg_browser/pages/image_viewer_page.dart';
import 'package:pigment/pigment.dart';

class PostContentImage extends StatelessWidget {
  final PostListItem post;
  final bool isViewingImage;

  const PostContentImage({Key key, this.post, this.isViewingImage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = post.height * MediaQuery.of(context).size.width / post.width;
    var bloc = BlocProvider.of<PostBloc>(context);
    return Container(
      color: Pigment.fromString("#284a81"),
      height: height,
      child: Stack(
        children: <Widget>[
          Hero(
            tag: "${post.md5}/thumb",
            child: TransitionToImage(
              fit: BoxFit.cover,
              height: height,
              enableRefresh: true,
              image: AdvancedNetworkImage(
                post.previewUrl,
                useDiskCache: true,
              ),
            ),
          ),
          Hero(
            tag: "${post.md5}/preview",
            child: TransitionToImage(
              fit: BoxFit.cover,
              height: height,
              enableRefresh: true,
              image: AdvancedNetworkImage(
                post.sampleUrl,
                useDiskCache: true,
              ),
            ),
          ),
          Hero(
            tag: "${post.md5}/hq",
            child: StreamBuilder(
              stream: bloc.highQuality,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data) {
                  return TransitionToImage(
                    fit: BoxFit.cover,
                    height: height,
                    enableRefresh: true,
                    image: AdvancedNetworkImage(
                      post.fileUrl,
                      useDiskCache: true,
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  if (!isViewingImage) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          bloc: PostBloc(post),
                          child: ImageViewerPage(post: post),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
