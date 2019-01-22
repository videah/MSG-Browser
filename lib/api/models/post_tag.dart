import 'package:json_annotation/json_annotation.dart';

part 'post_tag.g.dart';

@JsonSerializable()
class PostTag {

  final int id;
  final String name;
  final int type;
  @JsonKey(name: "type_locked")
  final bool typeLocked;

  PostTag(this.id, this.name, this.type, this.typeLocked);

  Map<String, dynamic> toJson() => _$PostTagToJson(this);
  factory PostTag.fromJson(Map<String, dynamic> json) =>
      _$PostTagFromJson(json);
}