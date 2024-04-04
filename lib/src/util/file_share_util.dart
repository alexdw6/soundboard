import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class FileShareUtil {
  Future<void> shareFile(String name, String filename, BuildContext context) async {
    final bundle = DefaultAssetBundle.of(context);
    final bytes = await bundle.load('assets/sounds/$filename');
    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/$filename').create();
    await file.writeAsBytes(bytes.buffer.asUint8List());

    return Share.shareFiles(['${tempDir.path}/$filename'], subject: name, mimeTypes: ['audio/wav']);
  }
}