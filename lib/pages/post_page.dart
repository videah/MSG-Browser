import 'package:flutter/material.dart';
import 'package:msg_browser/api/models/post_list_item.dart';
import 'package:msg_browser/widgets/post_action_button.dart';
import 'package:msg_browser/widgets/post_content_image.dart';
import 'package:msg_browser/widgets/post_content_video.dart';
import 'package:msg_browser/widgets/post_download_button.dart';
import 'package:msg_browser/widgets/post_high_quality_button.dart';
import 'package:msg_browser/widgets/tag_panel.dart';
import 'package:smart_text_view/smart_text_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pigment/pigment.dart';

class PostPage extends StatelessWidget {
  final PostListItem post;

  const PostPage({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post"),
        actions: <Widget>[
          if (post.file.extension != "webm" &&
              post.file.extension != "gif") ...[
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
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: post.file.extension == "webm"
                ? PostContentVideo(post: post)
                : PostContentImage(post: post),
          ),
          if (post.description.isNotEmpty) ...[
            Card(
              color: Pigment.fromString("#284a81"),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text("Description"),
                children: <Widget>[
                  Divider(),
                  ListTile(
                    title: SmartText(
                      text: post.description,
                      onOpen: (url) => launch(url),
                    ),
                  )
                ],
              ),
            ),
          ],
          Card(
            color: Pigment.fromString("#284a81"),
            child: ExpansionTile(
              title: Text("Tags"),
              children: <Widget>[
                TagPanel(post.tags),
              ],
            ),
          )
        ],
      ),
    );
  }
}
