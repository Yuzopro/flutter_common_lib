import 'package:flutter/material.dart';


class YZFonts {
  static const String montserrat_font_family = 'Montserrat';
}

class YZColors {
  static const String primaryValueString = "#24292E";
  static const String primaryLightValueString = "#42464b";
  static const String primaryDarkValueString = "#121917";
  static const String miWhiteString = "#ececec";
  static const String actionBlueString = "#267aff";
  static const String webDraculaBackgroundColorString = "#282a36";

  static const int primaryValue = 0xFF24292E;
  static const int primaryLightValue = 0xFF42464b;
  static const int primaryDarkValue = 0xFF121917;

  static const int cardWhite = 0xFFFFFFFF;
  static const int textWhite = 0xFFFFFFFF;
  static const int miWhite = 0xFFF4F5F6;
  static const int white = 0xFFFFFFFF;
  static const int actionBlue = 0xff267aff;
  static const int subLightTextColor = 0xffc4c4c4;

  static const int mainBackgroundColor = miWhite;

  static const int mainTextColor = 0xFF081530;
  static const int t65MainTextColor = 0xA6081530;
  static const int subTextColor = 0xFF8C939F;
  static const int textColorWhite = white;

  static const int redPointColor = 0xFFED5E4B;
}

class YZConstant {
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
    color: Color(YZColors.mainTextColor),
    fontSize: minTextSize,
  );

  static const smallTextWhite = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColorWhite),
    fontSize: smallTextSize,
  );

  static const smallText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.mainTextColor),
    fontSize: smallTextSize,
  );

  static const smallTextT65 = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.t65MainTextColor),
    fontSize: smallTextSize,
  );

  static const smallTextBold = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.mainTextColor),
    fontSize: smallTextSize,
    fontWeight: FontWeight.bold,
  );

  static const smallSubLightText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.subLightTextColor),
    fontSize: smallTextSize,
  );

  static const smallActionLightText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.actionBlue),
    fontSize: smallTextSize,
  );

  static const smallMiLightText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.miWhite),
    fontSize: smallTextSize,
  );

  static const smallSubText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.subTextColor),
    fontSize: smallTextSize,
  );

  static const middleText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.mainTextColor),
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

  static const middleSubLightText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.subLightTextColor),
    fontSize: middleTextWhiteSize,
  );

  static const middleTextBold = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.mainTextColor),
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
    color: Color(YZColors.mainTextColor),
    fontSize: normalTextSize,
  );

  static const normalTextBold = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.mainTextColor),
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

  static const normalTextActionWhiteBold = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.actionBlue),
    fontSize: normalTextSize,
    fontWeight: FontWeight.bold,
  );

  static const normalTextLight = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.primaryLightValue),
    fontSize: normalTextSize,
  );

  static const largeText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.mainTextColor),
    fontSize: bigTextSize,
  );

  static const largeTextBold = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.mainTextColor),
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
    color: Color(YZColors.primaryValue),
    fontSize: lagerTextSize,
    fontWeight: FontWeight.bold,
  );
}
