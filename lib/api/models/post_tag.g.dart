// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostTag _$PostTagFromJson(Map<String, dynamic> json) {
  return PostTag(
    json['id'] as int,
    json['name'] as String,
    json['type'] as int,
    json['type_locked'] as bool,
  );
}

Map<String, dynamic> _$PostTagToJson(PostTag instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'type_locked': instance.typeLocked,
    };
