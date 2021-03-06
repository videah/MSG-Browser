import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:msg_browser/api/models/post_list_item.dart';
import 'package:msg_browser/blocs/post_bloc.dart';
import 'package:msg_browser/pages/image_viewer_page.dart';
import 'package:msg_browser/pages/post_page.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:pigment/pigment.dart';

class ImageTile extends StatelessWidget {
  final PostListItem post;
  final bool idgaf;

  const ImageTile({Key key, this.post, this.idgaf = false}) : super(key: key);

  Widget _tileIcon(Icon icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: CircleAvatar(
              maxRadius: 14.0,
              child: icon,
            ),
            maxRadius: 15.0,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Color _ratingColor = post.rating == "e"
        ? Pigment.fromString("#e45f5f")
        : post.rating == "q" ? Pigment.fromString("#e4e150") : Colors.white;

    Color _scoreColor = post.score.total > 0
        ? Pigment.fromString("#3e9e49")
        : post.score.total < 0 ? Pigment.fromString("#e45f5f") : Colors.white;

    Color _borderColor = post.relationships.hasChildren
        ? Pigment.fromString("#0f0")
        : post.relationships.parentId != null
            ? Pigment.fromString("#cc0")
            : Pigment.fromString("#284a81");

    return Card(
      color: _borderColor,
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: post.file.width.toDouble(),
                    color: Pigment.fromString("#284a81"),
                    child: Conditional.single(
                      context: context,
                      conditionBuilder: (context) => post.preview.url != null,
                      widgetBuilder: (context) => Hero(
                        tag: "${post.file.md5}/thumb",
                        child: TransitionToImage(
                          fit: BoxFit.cover,
                          image: AdvancedNetworkImage(
                            post.preview.url,
                          ),
                        ),
                      ),
                      fallbackBuilder: (context) => Center(
                        child: Text("No Thumbnail"),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Pigment.fromString("#284a81"),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          post.score.total > 0
                              ? Icon(
                                  Icons.arrow_upward,
                                  size: 14.0,
                                  color: _scoreColor,
                                )
                              : post.score.total < 0
                                  ? Icon(
                                      Icons.arrow_downward,
                                      size: 14.0,
                                      color: _scoreColor,
                                    )
                                  : Icon(
                                      Icons.linear_scale,
                                      size: 14.0,
                                      color: _scoreColor,
                                    ),
                          Text(
                            " ${post.score.total}",
                            style: TextStyle(color: _scoreColor),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.favorite,
                            size: 14.0,
                          ),
                          Text(" ${post.favCount}"),
                        ],
                      ),
                      Text("C0"),
                      Text(
                        "${post.rating.toUpperCase()}",
                        style: TextStyle(color: _ratingColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          post.file.extension == "webm"
              ? _tileIcon(
                  Icon(
                    Icons.ondemand_video,
                    size: 18.0,
                  ),
                )
              : Container(),
          post.file.extension == "gif"
              ? _tileIcon(
                  Icon(
                    Icons.gif,
                    size: 28.0,
                  ),
                )
              : Container(),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  if (!idgaf) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return BlocProvider(
                            bloc: PostBloc(post),
                            child: PostPage(
                              post: post,
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ImageViewerPage(post: post);
                        },
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
