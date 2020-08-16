import 'package:json_annotation/json_annotation.dart';

import 'package:twp/repository/acf.dart';
import 'package:twp/repository/rendered_string.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  int id;
  RenderedString title;
  RenderedString content;
  ACF acf;
  String imageUrl;
  String thumbnailUrl;

  Location({
    this.id,
    this.title,
    this.content,
    this.acf,
    this.imageUrl = '',
    this.thumbnailUrl = '',
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
