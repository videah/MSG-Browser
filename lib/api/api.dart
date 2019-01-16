import 'dart:async';
import 'package:http/http.dart' as http;

class E621Client extends http.BaseClient {
  final http.Client _inner = http.Client();

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['user-agent'] = "MSGBrowser v0.1-debug";
    return _inner.send(request);
  }
}