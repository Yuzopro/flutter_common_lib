class TextUtil {
  static bool isEmpty(String str) {
    return str == null || str.length == 0;
  }

  static bool equals(String a, String b) {
    if (isEmpty(a) && isEmpty(b)) {
      return true;
    }
    if (a == b) {
      return true;
    }
    return false;
  }

  static List<String> split(String text, Pattern pattern,
      {List<String> defValue = const []}) {
    List<String> list = text?.split(pattern);
    return list ?? defValue;
  }

  static String replace(String text, Pattern from, String replace) {
    return text?.replaceAll(from, replace);
  }

  static bool contains(String text, String other) {
    if (TextUtil.isEmpty(text)) {
      return false;
    }

    return text.contains(other);
  }
}
