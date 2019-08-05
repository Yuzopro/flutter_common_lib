import 'dart:ui';

import 'package:share/share.dart';

class ShareUtil {
  static Future<void> share(
    String text, {
    String subject,
    Rect sharePositionOrigin,
  }) {
    Share.share('[Github Flutter版本-OpenGit] $text',
        subject: subject, sharePositionOrigin: sharePositionOrigin);
  }
}
