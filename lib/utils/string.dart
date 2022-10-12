class StringHelper {
  static String maxLength(String value, int length) {
    if (value.length > length) {
      return value.substring(0, length) + '...';
    }
    return value;
  }

  static String getAcronym(String value) {
    List<String> words = value.split(' ');
    String acronym = '';
    for (var i = 0; i < words.length; i++) {
      if (words[i].length > 0) {
        acronym += words[i][0];
      }
    }
    return acronym;
  }
}
