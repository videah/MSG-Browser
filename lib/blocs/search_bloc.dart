import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:msg_browser/api/api.dart';
import 'package:rxdart/rxdart.dart';
import 'package:msg_browser/api/models/post_list_item.dart';

class SearchBloc {

  final client = E621Client();
  List<PostListItem> _items;

  SearchBloc() {
    _grabInitialData();
  }

  void _grabInitialData() async {
    var response = await client.get("https://e621.net/post/index.json?limit=10");
    var decoded = json.decode(response.body);
    _items = (decoded as List).map((i) => PostListItem.fromJson(i)).toList();
    _itemsSubject.add(_items);
  }

  final _itemsSubject = BehaviorSubject<List<PostListItem>>();
  Stream<List<PostListItem>> get items => _itemsSubject.stream;

//  final _itemsController = StreamController<List<PostListItem>>();
//  Sink<List<PostListItem>> get items => _itemsController.sink;

  void dispose() {
    _itemsSubject.close();
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