import 'package:flutter/material.dart';
import 'package:msg_browser/api/models/post_tag.dart';
import 'package:pigment/pigment.dart';

class TagPanel extends StatelessWidget {

  List<PostTag> _generalTags;
  List<PostTag> _copyrightTags;
  List<PostTag> _characterTags;
  List<PostTag> _speciesTags;

  TagPanel(List<PostTag> tags) {
    _generalTags = tags.where((tag) => tag.type == 0).toList();
    _copyrightTags = tags.where((tag) => tag.type == 3).toList();
    _characterTags = tags.where((tag) => tag.type == 4).toList();
    _speciesTags = tags.where((tag) => tag.type == 5).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TagTile(
          title: "Character",
          textColor: Pigment.fromString("#0a0"),
          tags: _characterTags,
        ),
        TagTile(
          title: "Copyright",
          textColor: Pigment.fromString("#d0d"),
          tags: _copyrightTags,
        ),
        TagTile(
          title: "Species",
          textColor: Pigment.fromString("#ed5d1f"),
          tags: _speciesTags,
        ),
        TagTile(
          title: "General",
          tags: _generalTags,
        ),
      ],
    );
  }
}

class TagTile extends StatelessWidget {
  final Color textColor;
  final String title;
  final List<PostTag> tags;

  const TagTile({Key key, this.textColor, this.title, this.tags})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return tags.isNotEmpty
        ? ExpansionTile(
            initiallyExpanded: true,
            title: Text("$title"),
            children: <Widget>[
              ListTile(
                title: Text(
                  // TODO: Display this nicely
                  "${tags.map((f) => f.name).toList()}",
                  style: TextStyle(color: textColor),
                ),
              )
            ],
          )
        : Container();
  }
}
