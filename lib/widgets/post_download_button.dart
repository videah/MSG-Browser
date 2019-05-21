import 'package:flutter/material.dart';
import 'package:msg_browser/api/models/post_list_item.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

class PostDownloadButton extends StatelessWidget {

  final PostListItem post;

  const PostDownloadButton({Key key, this.post}) : super(key: key);

  Future<String> _findLocalPath(BuildContext context) async {
    final directory = Theme.of(context).platform == TargetPlatform.android
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return directory.path;
  }

  void _downloadPostToGallery(BuildContext context) async {
    var _localPath = (await _findLocalPath(context)) + "/Download";
    var _hasPermission = await PermissionHandler().checkPermissionStatus(
      PermissionGroup.storage,
    );

    // We need to make sure we have permission to store the downloaded file.
    if (_hasPermission != PermissionStatus.granted) {
      var _permission = await PermissionHandler().requestPermissions(
        [PermissionGroup.storage],
      );
      if (_permission[PermissionGroup.storage] != PermissionStatus.granted) return;
    }

    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: ListTile(
          title: Text("Downloading file to gallery"),
          subtitle: Text("${post.fileUrl}"),
          trailing: Icon(Icons.file_download),
        ),
      ),
    );

    FlutterDownloader.enqueue(
      url: post.fileUrl,
      savedDir: _localPath,
      showNotification: true,
      openFileFromNotification: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return IconButton(
          icon: Icon(Icons.file_download),
          tooltip: "Download",
          onPressed: () {
            _downloadPostToGallery(context);
          },
        );
      },
    );
  }
}