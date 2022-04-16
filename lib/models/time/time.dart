import 'package:fruity/utils/datetime_util.dart';
import 'package:json_annotation/json_annotation.dart';

class CustomDateTimeConverter implements JsonConverter<DateTime, String> {
  const CustomDateTimeConverter();

  @override
  DateTime fromJson(String json) {
    return DateTime.parse(json);
  }

  @override
  String toJson(DateTime json) =>
      DateTimeHelper.formatDate(json, 'yyyy-MM-dd HH:mm:ss');
}
