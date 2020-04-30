import 'package:flutter/material.dart';


class YZFonts {
  static const String montserrat_font_family = 'Montserrat';
}

class YZColors {
  static const int miWhite = 0xFFF4F5F6;

  static const int white = 0xFFFFFFFF;

  static const int mainBackgroundColor = miWhite;

  static const int textColor = 0xFF081530;
  static const int t65TextColor = 0xA6081530;
  static const int subTextColor = 0xFF8C939F;
  static const int textColorWhite = white;

  static const int redPointColor = 0xFFED5E4B;

  static const Color divider = Color(0xffe5e5e5);
}

class YZStyle {
  static const lagerTextSize = 30.0;
  static const bigTextSize = 23.0;
  static const normalTextSize = 18.0;
  static const middleTextWhiteSize = 16.0;
  static const smallTextSize = 14.0;
  static const minTextSize = 12.0;

  static const minSubText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.subTextColor),
    fontSize: minTextSize,
  );

  static const minText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColor),
    fontSize: minTextSize,
  );

  static const smallTextWhite = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColorWhite),
    fontSize: smallTextSize,
  );

  static const smallText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColor),
    fontSize: smallTextSize,
  );

  static const smallTextT65 = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.t65TextColor),
    fontSize: smallTextSize,
  );

  static const smallTextBold = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColor),
    fontSize: smallTextSize,
    fontWeight: FontWeight.bold,
  );

  static const smallSubText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.subTextColor),
    fontSize: smallTextSize,
  );

  static const middleText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColor),
    fontSize: middleTextWhiteSize,
  );

  static const middleTextWhite = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColorWhite),
    fontSize: middleTextWhiteSize,
  );

  static const middleSubText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.subTextColor),
    fontSize: middleTextWhiteSize,
  );
  
  static const middleTextBold = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColor),
    fontSize: middleTextWhiteSize,
    fontWeight: FontWeight.bold,
  );

  static const middleTextWhiteBold = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColorWhite),
    fontSize: middleTextWhiteSize,
    fontWeight: FontWeight.bold,
  );

  static const middleSubTextBold = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.subTextColor),
    fontSize: middleTextWhiteSize,
    fontWeight: FontWeight.bold,
  );

  static const normalText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColor),
    fontSize: normalTextSize,
  );

  static const normalTextBold = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColor),
    fontSize: normalTextSize,
    fontWeight: FontWeight.bold,
  );

  static const normalSubText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.subTextColor),
    fontSize: normalTextSize,
  );

  static const normalTextWhite = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColorWhite),
    fontSize: normalTextSize,
  );

  static const normalTextMitWhiteBold = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.miWhite),
    fontSize: normalTextSize,
    fontWeight: FontWeight.bold,
  );

  static const largeText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColor),
    fontSize: bigTextSize,
  );

  static const largeTextBold = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColor),
    fontSize: bigTextSize,
    fontWeight: FontWeight.bold,
  );

  static const largeTextWhite = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColorWhite),
    fontSize: bigTextSize,
  );

  static const largeTextWhiteBold = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColorWhite),
    fontSize: bigTextSize,
    fontWeight: FontWeight.bold,
  );

  static const largeLargeTextWhite = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColorWhite),
    fontSize: lagerTextSize,
    fontWeight: FontWeight.bold,
  );

  static const largeLargeText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColor),
    fontSize: lagerTextSize,
    fontWeight: FontWeight.bold,
  );
}

class YZSize {
  static const SMALL_IMAGE_SIZE = 18.0;
  static const NORMAL_IMAGE_SIZE = 24.0;
  static const BIG_IMAGE_SIZE = 36.0;
  static const LARGE_IMAGE_SIZE = 48.0;
}
