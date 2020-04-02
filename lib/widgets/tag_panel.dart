import 'package:flutter/material.dart';
import 'package:msg_browser/api/models/post_arrays.dart';
import 'package:pigment/pigment.dart';

class TagPanel extends StatelessWidget {

  final PostTags tags;

  TagPanel(this.tags);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TagTile(
          title: "Character",
          textColor: Pigment.fromString("#0a0"),
          fontWeight: FontWeight.bold,
          tags: tags.character,
        ),
        TagTile(
          title: "Copyright",
          textColor: Pigment.fromString("#d0d"),
          fontWeight: FontWeight.bold,
          tags: tags.copyright,
        ),
        TagTile(
          title: "Species",
          fontWeight: FontWeight.bold,
          textColor: Pigment.fromString("#ed5d1f"),
          tags: tags.species,
        ),
        TagTile(
          title: "General",
          tags: tags.general,
        ),
      ],
    );
  }
}

class TagTile extends StatelessWidget {
  final Color textColor;
  final String title;
  final List<String> tags;
  final FontWeight fontWeight;

  const TagTile(
      {Key key, this.textColor, this.title, this.tags, this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Testing: $tags");
    if (tags != null && tags.isNotEmpty) {
      return ListTile(
        title: Text("$title"),
        subtitle: Text(
          // TODO: Display this nicely
          "${tags.join(", ")}",
          style: TextStyle(color: textColor, fontWeight: fontWeight),
        ),
      );
    } else {
      return Container();
    }
  }
}
