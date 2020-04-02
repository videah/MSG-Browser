import 'dart:async';
import 'package:msg_browser/api/api.dart';
import 'package:rxdart/rxdart.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class PostBloc extends Bloc {
  final client = E621Client();
  bool _showHighQuality = false;

  PostBloc(post) {
    _highQualityController.stream.listen(_handleHighQuality);
  }

  _handleHighQuality(_) async {
    _showHighQuality = !_showHighQuality;
    _highQualitySubject.add(_showHighQuality);
  }

  final _highQualitySubject = BehaviorSubject<bool>();
  Stream<bool> get highQuality => _highQualitySubject.stream;

  final _highQualityController = StreamController<bool>();
  Sink<bool> get toggleHighQuality => _highQualityController.sink;

  void dispose() {
    _highQualitySubject.close();
    _highQualityController.close();
  }
}
