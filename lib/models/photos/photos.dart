
import 'package:json_annotation/json_annotation.dart';
part 'photos.g.dart';
@JsonSerializable()
class Photos {
  final String id;
  final String url;
  final int? width;
  final int? height;

  Photos({required this.id,
    required this.url, required this.width, required this.height
  });

  factory Photos.fromJson(Map<String, dynamic> json) =>_$PhotosFromJson(json);
  Map<String, dynamic> toJson() => _$PhotosToJson(this);
}