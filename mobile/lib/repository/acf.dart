import 'package:json_annotation/json_annotation.dart';

part 'acf.g.dart';

@JsonSerializable()
class ACF {
  String address;
  String latitude;
  String longitude;

  ACF({
    this.address,
    this.latitude,
    this.longitude,
  });

  factory ACF.fromJson(Map<String, dynamic> json) => _$ACFFromJson(json);
  Map<String, dynamic> toJson() => _$ACFToJson(this);
}
