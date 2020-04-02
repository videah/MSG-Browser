import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:msg_browser/api/api.dart';
import 'package:rxdart/rxdart.dart';
import 'package:msg_browser/api/models/post_list_item.dart';

class SearchBloc extends Bloc {
  final client = E621Client();
  List<PostListItem> _items;
  String _tags;
  bool noMorePages = false;

  // Flash is a dead meme.
  // TODO: maybe do this in the search query instead
  _stripFlashPosts(List<PostListItem> posts) {
    posts.removeWhere((f) => f.file.extension == "swf");
    return posts;
  }

  Future _handleSearch(String tags, {bool clearPage = true}) async {
    try {
      if (clearPage) _itemsSubject.add(null);
      noMorePages = false;
      _tags = tags;
      _searchSubject.add(_tags);

      var response = await client.get(
        "https://e621.net/posts.json?tags=$_tags",
      );
      var decoded = json.decode(response.body);

      List<PostListItem> posts =
          (decoded["posts"] as List).map((i) => PostListItem.fromJson(i)).toList();
      _items = _stripFlashPosts(posts);
      if (_items.isEmpty) {
        _itemsSubject.addError("No posts matched your search");
      } else {
        _itemsSubject.add(_items);
      }
    } catch (e) {
      if (e is SocketException) {
        _itemsSubject.addError("Could not connect to e621");
      } else {
        print(e);
        _itemsSubject.addError("An unknown error occured");
      }
    }
  }

  Future _handleLoadMore(int id) async {
    if (!noMorePages) {
      var response = await client.get(
        "https://e621.net/post/index.json?tags=$_tags&before_id=$id",
      );
      print("https://e621.net/post/index.json?tags=$_tags&before_id=$id");
      var decoded = json.decode(response.body);

      List<PostListItem> posts =
          (decoded as List).map((i) => PostListItem.fromJson(i)).toList();
      // If there's nothing then we've hit a dead end and should stop loading.
      noMorePages = posts.isEmpty ?? true;
      if (!noMorePages) {
        _items.addAll(_stripFlashPosts(posts));
        _itemsSubject.add(_items);
      }
    }
  }

  Future refresh() async => await _handleSearch(_tags, clearPage: false);

  SearchBloc() {
    _searchController.stream.listen(_handleSearch);
    _loadMoreController.stream.listen(_handleLoadMore);
  }

  final _itemsSubject = BehaviorSubject<List<PostListItem>>();
  Stream<List<PostListItem>> get items => _itemsSubject.stream;

  final _searchSubject = BehaviorSubject<String>();
  Stream<String> get tags => _searchSubject.stream;

  final _searchController = StreamController<String>();
  Sink<String> get search => _searchController.sink;

  final _loadMoreController = StreamController<int>();
  Sink<int> get loadMore => _loadMoreController.sink;

  void dispose() {
    _itemsSubject.close();
    _searchSubject.close();
    _searchController.close();
    _loadMoreController.close();
  }
}
