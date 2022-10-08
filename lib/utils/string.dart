class StringHelper {
  static String maxLength(String value, int length) {
    if (value.length > length) {
      return value.substring(0, length) + '...';
    }
    return value;
  }
}