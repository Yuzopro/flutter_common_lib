import 'package:flutter/material.dart';
import 'package:flutter_base_ui/flutter_base_ui.dart';
import 'package:flutter_common_util/flutter_common_util.dart';

class LabelIcon extends StatelessWidget {
  final label;
  final image;
  final onPressed;

  LabelIcon({this.label, this.image, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final ButtonThemeData buttonTheme = ButtonTheme.of(context);
    final double paddingUnit = buttonTheme.padding.horizontal / 4.0;

    return InkWell(
      onTap: () => onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingUnit),
        child: Row(
          children: <Widget>[
            ImageUtil.getImage(image, 14.0, 14.0),
            SizedBox(
              width: 5.0,
            ),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: YZConstant.smallSubText,
            )
          ],
        ),
      ),
    );
  }
}
