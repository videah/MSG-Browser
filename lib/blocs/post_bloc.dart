import 'dart:async';
import 'dart:convert';
import 'package:msg_browser/api/api.dart';
import 'package:msg_browser/api/models/post_list_item.dart';
import 'package:rxdart/rxdart.dart';
import 'package:msg_browser/api/models/post_tag.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class PostBloc extends Bloc {
  final client = E621Client();
  List<PostTag> _tags;
  bool _showHighQuality = false;

  PostBloc(post) {
    _handleTags(post);
    _highQualityController.stream.listen(_handleHighQuality);
  }

  _handleHighQuality(_) async {
    _showHighQuality = !_showHighQuality;
    _highQualitySubject.add(_showHighQuality);
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

  final _highQualitySubject = BehaviorSubject<bool>();
  Stream<bool> get highQuality => _highQualitySubject.stream;

  final _highQualityController = StreamController<bool>();
  Sink<bool> get toggleHighQuality => _highQualityController.sink;

  void dispose() {
    _tagSubject.close();
    _highQualitySubject.close();
    _highQualityController.close();
  }
}
