enum DateFormat {
  yyyy_MM_dd_HH_mm_ss, //yyyy-MM-dd HH:mm:ss
  yyyy_MM_dd_HH_mm, //yyyy-MM-dd HH:mm
  yyyy_MM_dd, //yyyy-MM-dd
  yyyy_MM, //yyyy-MM
  MM_dd, //MM-dd
  MM_dd_HH_mm, //MM-dd HH:mm
  HH_mm_ss, //HH:mm:ss
  HH_mm, //HH:mm

  ZH_yyyy_MM_dd_HH_mm_ss, //yyyy年MM月dd日 HH时mm分ss秒
  ZH_yyyy_MM_dd_HH_mm, //yyyy年MM月dd日 HH时mm分
  ZH_yyyy_MM_dd, //yyyy年MM月dd日
  ZH_yyyy_MM, //yyyy年MM月
  ZH_MM_dd, //MM月dd日
  ZH_MM_dd_HH_mm, //MM月dd日 HH时mm分
  ZH_HH_mm_ss, //HH时mm分ss秒
  ZH_HH_mm, //HH时mm分
}

class DateUtil {
  static List<String> _zh_week_name = [
    "星期一",
    "星期二",
    "星期三",
    "星期四",
    "星期五",
    "星期六",
    "星期日",
  ];

  static List<String> _week_name = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  ///今天HH:mm
  ///昨天HH:mm
  ///星期几 HH:mm
  ///MM-dd HH:mm
  ///yyyy-MM-dd HH:mm
  static String getMultiDateStr(DateTime date) {
    String result = "";
    try {
      DateTime now = DateTime.now();

      date = date.toLocal();

      if (now.year == date.year) {
        //当年
        if (now.month == date.month) {
          //当月
          int temp = now.day - date.day;
          switch (temp) {
            case 0: //今天
              result = "今天 " +
                  getDateStrByDateTime(date, format: DateFormat.ZH_HH_mm);
              break;
            case 1: //昨天
              result =
                  "昨天 " + getDateStrByDateTime(date, format: DateFormat.HH_mm);
              break;
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
              result = getZHWeekDay(date) +
                  " " +
                  getDateStrByDateTime(date, format: DateFormat.HH_mm);
              break;
            default:
              result =
                  getDateStrByDateTime(date, format: DateFormat.MM_dd_HH_mm);
              break;
          }
        } else {
          result = getDateStrByDateTime(date, format: DateFormat.MM_dd_HH_mm);
        }
      } else {
        result =
            getDateStrByDateTime(date, format: DateFormat.yyyy_MM_dd_HH_mm);
      }
      return result;
    } catch (e) {
      return "";
    }
  }

  static String getDateStrByDateTime(DateTime dateTime,
      {DateFormat format = DateFormat.yyyy_MM_dd_HH_mm_ss}) {
    if (dateTime == null) {
      return '';
    }
    ;
    String dateStr;
    if (_isZHFormat(format)) {
      dateStr = _formatZHDateTime(dateTime, format);
    } else {
      dateStr = _formatDateTime(dateTime, format);
    }
    return dateStr;
  }

  static String _formatZHDateTime(DateTime dateTime, DateFormat format) {
    String dateTimeStr = dateTime.toString();
    dateTimeStr = _convertToZHDateTimeStr(dateTimeStr);
    switch (format) {
      case DateFormat.ZH_yyyy_MM_dd_HH_mm_ss: //yyyy年MM月dd日 HH时mm分ss秒
        dateTimeStr = dateTimeStr.substring(0, "yyyy年MM月dd日 HH时mm分ss秒".length);
        break;
      case DateFormat.ZH_yyyy_MM_dd_HH_mm: //yyyy年MM月dd日 HH时mm分
        dateTimeStr = dateTimeStr.substring(0, "yyyy年MM月dd日 HH时mm分".length);
        break;
      case DateFormat.ZH_yyyy_MM_dd: //yyyy年MM月dd日
        dateTimeStr = dateTimeStr.substring(0, "yyyy年MM月dd日".length);
        break;
      case DateFormat.ZH_yyyy_MM: //yyyy年MM月
        dateTimeStr = dateTimeStr.substring(0, "yyyy年MM月".length);
        break;
      case DateFormat.ZH_MM_dd: //MM月dd日
        dateTimeStr =
            dateTimeStr.substring("yyyy年".length, "yyyy年MM月dd日".length);
        break;
      case DateFormat.ZH_MM_dd_HH_mm: //MM月dd日 HH时mm分
        dateTimeStr =
            dateTimeStr.substring("yyyy年".length, "yyyy年MM月dd日 HH时mm分".length);
        break;
      case DateFormat.ZH_HH_mm_ss: //HH时mm分ss秒
        dateTimeStr = dateTimeStr.substring(
            "yyyy年MM月dd日 ".length, "yyyy年MM月dd日 HH时mm分ss秒".length);
        break;
      case DateFormat.ZH_HH_mm: //HH时mm分
        dateTimeStr = dateTimeStr.substring(
            "yyyy年MM月dd日 ".length, "yyyy年MM月dd日 HH时mm分".length);
        break;
      default:
        break;
    }
    return dateTimeStr;
  }

  static String _formatDateTime(DateTime dateTime, DateFormat format) {
    String dateTimeStr = dateTime.toString();
    switch (format) {
      case DateFormat.yyyy_MM_dd_HH_mm_ss: //yyyy-MM-dd HH:mm:ss
        dateTimeStr = dateTimeStr.substring(0, "yyyy-MM-dd HH:mm:ss".length);
        break;
      case DateFormat.yyyy_MM_dd_HH_mm: //yyyy-MM-dd HH:mm
        dateTimeStr = dateTimeStr.substring(0, "yyyy-MM-dd HH:mm".length);
        break;
      case DateFormat.yyyy_MM_dd: //yyyy-MM-dd
        dateTimeStr = dateTimeStr.substring(0, "yyyy-MM-dd".length);
        break;
      case DateFormat.yyyy_MM: //yyyy-MM
        dateTimeStr = dateTimeStr.substring(0, "yyyy-MM".length);
        break;
      case DateFormat.MM_dd: //MM-dd
        dateTimeStr =
            dateTimeStr.substring("yyyy-".length, "yyyy-MM-dd".length);
        break;
      case DateFormat.MM_dd_HH_mm: //MM-dd HH:mm
        dateTimeStr =
            dateTimeStr.substring("yyyy-".length, "yyyy-MM-dd HH:mm".length);
        break;
      case DateFormat.HH_mm_ss: //HH:mm:ss
        dateTimeStr = dateTimeStr.substring(
            "yyyy-MM-dd ".length, "yyyy-MM-dd HH:mm:ss".length);
        break;
      case DateFormat.HH_mm: //HH:mm
        dateTimeStr = dateTimeStr.substring(
            "yyyy-MM-dd ".length, "yyyy-MM-dd HH:mm".length);
        break;
      default:
        break;
    }
    return dateTimeStr;
  }

  static String getWeekDay(DateTime dateTime) {
    if (dateTime == null) {
      return null;
    }
    return _week_name[dateTime.weekday - 1];
  }

  static String getZHWeekDay(DateTime dateTime) {
    if (dateTime == null) {
      return null;
    }
    return _zh_week_name[dateTime.weekday - 1];
  }

  static bool _isZHFormat(DateFormat format) {
    return format == DateFormat.ZH_yyyy_MM_dd_HH_mm_ss ||
        format == DateFormat.ZH_yyyy_MM_dd_HH_mm ||
        format == DateFormat.ZH_yyyy_MM_dd ||
        format == DateFormat.ZH_yyyy_MM ||
        format == DateFormat.ZH_MM_dd ||
        format == DateFormat.ZH_MM_dd_HH_mm ||
        format == DateFormat.ZH_HH_mm_ss ||
        format == DateFormat.ZH_HH_mm;
  }

  static String _convertToZHDateTimeStr(String time) {
    time = time.replaceFirst("-", "年");
    time = time.replaceFirst("-", "月");
    time = time.replaceFirst(" ", "日 ");
    time = time.replaceFirst(":", "时");
    time = time.replaceFirst(":", "分");
    time = time.replaceFirst(".", "秒");
    time = time + "毫秒";
    return time;
  }
}
