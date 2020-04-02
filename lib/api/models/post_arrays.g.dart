// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_arrays.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostFile _$PostFileFromJson(Map<String, dynamic> json) {
  return PostFile(
    json['width'] as int,
    json['height'] as int,
    json['extension'] as String,
    json['size'] as int,
    json['md5'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$PostFileToJson(PostFile instance) => <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'extension': instance.extension,
      'size': instance.size,
      'md5': instance.md5,
      'url': instance.url,
    };

PostPreview _$PostPreviewFromJson(Map<String, dynamic> json) {
  return PostPreview(
    json['width'] as int,
    json['height'] as int,
    json['url'] as String,
  );
}

Map<String, dynamic> _$PostPreviewToJson(PostPreview instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
    };

PostSample _$PostSampleFromJson(Map<String, dynamic> json) {
  return PostSample(
    json['has'] as bool,
    json['width'] as int,
    json['height'] as int,
    json['url'] as String,
  );
}

Map<String, dynamic> _$PostSampleToJson(PostSample instance) =>
    <String, dynamic>{
      'has': instance.hasThumbnail,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
    };

PostTags _$PostTagsFromJson(Map<String, dynamic> json) {
  return PostTags(
    (json['general'] as List)?.map((e) => e as String)?.toList(),
    (json['species'] as List)?.map((e) => e as String)?.toList(),
    (json['character'] as List)?.map((e) => e as String)?.toList(),
    (json['copyright'] as List)?.map((e) => e as String)?.toList(),
    (json['artist'] as List)?.map((e) => e as String)?.toList(),
    (json['invalid'] as List)?.map((e) => e as String)?.toList(),
    (json['lore'] as List)?.map((e) => e as String)?.toList(),
    (json['meta'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PostTagsToJson(PostTags instance) => <String, dynamic>{
      'general': instance.general,
      'species': instance.species,
      'character': instance.character,
      'copyright': instance.copyright,
      'artist': instance.artist,
      'invalid': instance.invalid,
      'lore': instance.lore,
      'meta': instance.meta,
    };

PostFlags _$PostFlagsFromJson(Map<String, dynamic> json) {
  return PostFlags(
    json['pending'] as bool,
    json['flagged'] as bool,
    json['note_locked'] as bool,
    json['status_locked'] as bool,
    json['rating_locked'] as bool,
    json['deleted'] as bool,
  );
}

Map<String, dynamic> _$PostFlagsToJson(PostFlags instance) => <String, dynamic>{
      'pending': instance.pending,
      'flagged': instance.flagged,
      'note_locked': instance.noteLocked,
      'status_locked': instance.statusLocked,
      'rating_locked': instance.ratingLocked,
      'deleted': instance.deleted,
    };

PostRelationship _$PostRelationshipFromJson(Map<String, dynamic> json) {
  return PostRelationship(
    json['parent_id'] as int,
    json['has_children'] as bool,
    json['has_active_children'] as bool,
    (json['children'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$PostRelationshipToJson(PostRelationship instance) =>
    <String, dynamic>{
      'parent_id': instance.parentId,
      'has_children': instance.hasChildren,
      'has_active_children': instance.hasActiveChildren,
      'children': instance.children,
    };

PostScore _$PostScoreFromJson(Map<String, dynamic> json) {
  return PostScore(
    json['up'] as int,
    json['down'] as int,
    json['total'] as int,
  );
}

Map<String, dynamic> _$PostScoreToJson(PostScore instance) => <String, dynamic>{
      'up': instance.up,
      'down': instance.down,
      'total': instance.total,
    };
