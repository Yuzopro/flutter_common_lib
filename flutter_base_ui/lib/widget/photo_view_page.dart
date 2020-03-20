import 'package:flutter/material.dart';
import 'package:flutter_base_ui/flutter_base_ui.dart';
import 'package:flutter_common_util/flutter_common_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewPage extends StatelessWidget {
  final String title;
  final String url;
  final String defaultImg;

  PhotoViewPage(this.title, this.url, this.defaultImg);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: YZStyle.normalTextWhite,
        ),
      ),
      body: Container(
        color: Colors.black,
        child: PhotoView(
          imageProvider: NetworkImage(url),
          loadingChild: Container(
            child: Stack(
              children: <Widget>[
                Center(child: ImageUtil.getImage(defaultImg, 180.0, 180.0)),
                Center(
                  child: SpinKitCircle(color: Colors.white30, size: 25.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
