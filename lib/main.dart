import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:multimediaPlayer/ui/layout.dart';

import 'package:multimediaPlayer/ui/mediaPlayer.dart';

void main() {
  runApp(HotReloadApp());
}

class HotReloadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return mediaPlayer();
    //return layout();
  }
}
