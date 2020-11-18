import 'package:flutter/material.dart';
import '../workers/store_image.dart';
import 'package:photo_view/photo_view.dart';
import '../themes/theme.dart';

class FullscreenImage extends StatelessWidget {
  final ImageStore data;

  FullscreenImage({
    Key key,
    @required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        elevation: 0,
        titleSpacing: 0.0,
        backgroundColor: AppTheme.lightTheme.primaryColor,
        title: Text(
          "Photo View",
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
      ),
      body: Center(child: PhotoView(imageProvider: AssetImage(data.url))),
    );
  }
}
