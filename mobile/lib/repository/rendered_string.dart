import 'package:json_annotation/json_annotation.dart';

part 'rendered_string.g.dart';

@JsonSerializable()
class RenderedString {
  String rendered;

  RenderedString({
    this.rendered,
  });

  factory RenderedString.fromJson(Map<String, dynamic> json) =>
      _$RenderedStringFromJson(json);
  Map<String, dynamic> toJson() => _$RenderedStringToJson(this);
}
