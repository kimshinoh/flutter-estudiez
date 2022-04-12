class CurrencyHelper {
  static String withCommas({
    required double? value,
    bool removeDecimal = false,
  }) {
    return value!.toStringAsFixed(removeDecimal ? 0 : 2).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
  }
}
