import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

class ImageUtil {
  static const _IMAGE_END = [".png", ".jpg", ".jpeg", ".gif", ".svg"];

  static Widget getCircleNetworkImage(
      String url, double size, String defaultName) {
    return ClipOval(
      child: getNetworkImageBySize(url, size, defaultName),
    );
  }

  static Widget getNetworkImageBySize(String url, double size, String defaultName) {
    return CachedNetworkImage(
      imageUrl: url ?? "",
      placeholder: (context, url) {
        return Image.asset(defaultName, width: size, height: size);
      },
      errorWidget: (context, url, error) {
        return Image.asset(defaultName, width: size, height: size);
      },
      width: size,
      height: size,
      fit: BoxFit.cover,
    );
  }

  static Widget getNetworkImage(String url) {
    return CachedNetworkImage(
      imageUrl: url ?? "",
      fit: BoxFit.cover,
    );
  }

  static Widget getImage(String name, double width, double height) {
    return Image.asset(
      name,
      width: width,
      height: height,
    );
  }

  static bool isImage(String path) {
    for (String item in _IMAGE_END) {
      if (path.contains(item)) {
        return true;
      }
    }
    return false;
  }
}
