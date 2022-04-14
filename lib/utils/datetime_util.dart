// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeHelper {
  DateTimeHelper._();

  static String formatDate(DateTime date, String formatString) {
    return DateFormat(formatString).format(date);
  }

  static String getVietnameseDayOfWeek(DateTime date) {
    switch (date.weekday) {
      case DateTime.monday:
        return 'Thứ hai';
      case DateTime.tuesday:
        return 'Thứ ba';
      case DateTime.wednesday:
        return 'Thứ tư';
      case DateTime.thursday:
        return 'Thứ năm';
      case DateTime.friday:
        return 'Thứ sáu';
      case DateTime.saturday:
        return 'Thứ bảy';
      case DateTime.sunday:
        return 'Chủ nhật';
      default:
        return '';
    }
  }

  static String getVietnameseAdverbsOfTime(
      DateTime originDate, DateTime compareDate) {
    final int diffDate =
        DateTime(originDate.year, originDate.month, originDate.day)
            .difference(
                DateTime(compareDate.year, compareDate.month, compareDate.day))
            .inDays
            .abs();
    final bool originLess = originDate.isBefore(compareDate);

    switch (diffDate) {
      case 0:
        return 'hôm nay';
      case 1:
        return originLess ? 'ngày mai' : 'hôm qua';
      default:
        return originLess ? '${diffDate} ngày sau' : '${diffDate} ngày trước';
    }
  }

  static List<String> getTimesBetween(
    DateTime startTime,
    DateTime endTime,
    int minutesInterval,
  ) {
    final List<String> times = [];
    final int diffMinutes = endTime.difference(startTime).inMinutes;

    for (int i = minutesInterval; i <= diffMinutes; i += minutesInterval) {
      final DateTime time = startTime.add(Duration(minutes: i));
      times.add(formatDate(time, 'HH:mm'));
    }

    return times;
  }
}
