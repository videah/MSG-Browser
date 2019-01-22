import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:msg_browser/api/api.dart';
import 'package:msg_browser/api/models/post_list_item.dart';
import 'package:rxdart/rxdart.dart';
import 'package:msg_browser/api/models/post_tag.dart';

class PostBloc {
  final client = E621Client();
  List<PostTag> _tags;

  PostBloc(post) {
    _handleTags(post);
  }

  _handleTags(PostListItem post) async {
    var response = await client.get(
      "https://e621.net/post/tags.json?id=${post.id}",
    );
    var decoded = json.decode(response.body);
    _tags = (decoded as List).map((i) => PostTag.fromJson(i)).toList();
    _tagSubject.add(_tags);
  }

  final _tagSubject = BehaviorSubject<List<PostTag>>();
  Stream<List<PostTag>> get tags => _tagSubject.stream;

  void dispose() {
    _tagSubject.close();
  }
}

class PostProvider extends InheritedWidget {
  final PostBloc bloc;

  PostProvider({
    Key key,
    @required this.bloc,
    Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static PostBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(PostProvider) as PostProvider).bloc;
}
