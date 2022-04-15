import 'package:json_annotation/json_annotation.dart';

part 'seller.g.dart';

@JsonSerializable(explicitToJson: true)
class Seller {
  Seller(
      {required this.id,
      required this.name,
      required this.logo,
      required this.banner,
      required this.type,
      required this.description,
      required this.headQuarter,
      required this.rating,
      required this.totalVote,
      required this.availableTime,
      this.email,
      this.phoneNumber,
      this.note});

  factory Seller.fromJson(Map<String, dynamic> json) => _$SellerFromJson(json);
  Map<String, dynamic> toJson() => _$SellerToJson(this);

  String id;
  String name;
  String logo;
  String banner;
  String type;
  String description;

  @JsonKey(name: 'head_quarter')
  String headQuarter;
  double rating;

  @JsonKey(name: 'total_vote')
  int totalVote;

  @JsonKey(name: 'available_time')
  AvailableTime availableTime;

  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  String? note;
  String? email;

  String getType() {
    switch (type.toLowerCase()) {
      case 'retailer':
        return 'Nhà cung cấp';
      case 'delivery':
        return 'Nhà giao hàng';
      default:
        return type;
    }
  }
}

@JsonSerializable(explicitToJson: true)
class AvailableTime {
  AvailableTime({
    required this.openTime,
    required this.closeTime,
    this.holidays,
  });

  factory AvailableTime.fromJson(Map<String, dynamic> json) =>
      _$AvailableTimeFromJson(json);
  Map<String, dynamic> toJson() => _$AvailableTimeToJson(this);

  @JsonKey(name: 'open_time', defaultValue: '08.00')
  String openTime;

  @JsonKey(name: 'close_time', defaultValue: '21.00')
  String closeTime;
  List<Holiday>? holidays;
}

@JsonSerializable(explicitToJson: true)
class Holiday {
  Holiday({
    required this.name,
    required this.startDate,
    required this.endDate,
  });

  factory Holiday.fromJson(Map<String, dynamic> json) =>
      _$HolidayFromJson(json);
  Map<String, dynamic> toJson() => _$HolidayToJson(this);

  String name;

  @JsonKey(name: 'start_date')
  DateTime startDate;
  @JsonKey(name: 'end_date')
  DateTime endDate;
}
