import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:msg_browser/api/api.dart';
import 'package:rxdart/rxdart.dart';
import 'package:msg_browser/api/models/post_list_item.dart';

class SearchBloc {
  final client = E621Client();
  List<PostListItem> _items;
  String _tags;

  // Flash is a dead meme.
  // TODO: maybe do this in the search query instead
  _stripFlashPosts(List<PostListItem> posts) {
    posts.removeWhere((f) => f.fileExt == "swf");
    return posts;
  }

  _handleSearch(String tags) async {
    _tags = tags;
    _searchSubject.add(_tags);
    var response =
        await client.get("https://e621.net/post/index.json?tags=$tags");
    var decoded = json.decode(response.body);

    List<PostListItem> posts =
        (decoded as List).map((i) => PostListItem.fromJson(i)).toList();
    _items = _stripFlashPosts(posts);
    _itemsSubject.add(_items);
  }

  SearchBloc() {
    _searchController.stream.listen(_handleSearch);
  }

  void _grabInitialData() async {
    var response =
        await client.get("https://e621.net/post/index.json?limit=10");
    var decoded = json.decode(response.body);
    _items = (decoded as List).map((i) => PostListItem.fromJson(i)).toList();
    _itemsSubject.add(_items);
  }

  final _itemsSubject = BehaviorSubject<List<PostListItem>>();
  Stream<List<PostListItem>> get items => _itemsSubject.stream;

  final _searchSubject = BehaviorSubject<String>();
  Stream<String> get tags => _searchSubject.stream;

  final _searchController = StreamController<String>();
  Sink<String> get search => _searchController.sink;

  void dispose() {
    _itemsSubject.close();
    _searchSubject.close();
    _searchController.close();
  }
}

class SearchProvider extends InheritedWidget {
  final SearchBloc bloc;

  SearchProvider({
    Key key,
    @required this.bloc,
    Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static SearchBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(SearchProvider) as SearchProvider)
          .bloc;
}
