class FileUtil {
  static final int unit_b = 1024;
  static final int unit_kb = unit_b * unit_b;
  static final int unit_mb = unit_kb * unit_b;

  static String formatFileSize(int size) {
    String formatSize = "";
    if (size == 0) {
      return '0B';
    }
    if (size < unit_b) {
      formatSize = size.toString() + "B";
    } else if (size < unit_kb) {
      formatSize = (size / unit_b).toStringAsFixed(2) + "KB";
    } else if (size < unit_mb) {
      formatSize = (size / unit_kb).toStringAsFixed(2) + "MB";
    } else {
      formatSize = (size / unit_mb).toStringAsFixed(2) + "GB";
    }
    return formatSize;
  }
}
