// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatedAt _$CreatedAtFromJson(Map<String, dynamic> json) {
  return CreatedAt(
    json['json_class'] as String,
    json['s'] as int,
    json['n'] as int,
  );
}

Map<String, dynamic> _$CreatedAtToJson(CreatedAt instance) => <String, dynamic>{
      'json_class': instance.jsonClass,
      's': instance.s,
      'n': instance.n,
    };

PostListItem _$PostListItemFromJson(Map<String, dynamic> json) {
  return PostListItem(
    json['id'] as int,
    json['created_at'] as String,
    json['updated_at'] as String,
    json['file'] == null
        ? null
        : PostFile.fromJson(json['file'] as Map<String, dynamic>),
    json['preview'] == null
        ? null
        : PostPreview.fromJson(json['preview'] as Map<String, dynamic>),
    json['sample'] == null
        ? null
        : PostSample.fromJson(json['sample'] as Map<String, dynamic>),
    json['score'] == null
        ? null
        : PostScore.fromJson(json['score'] as Map<String, dynamic>),
    json['tags'] == null
        ? null
        : PostTags.fromJson(json['tags'] as Map<String, dynamic>),
    (json['lockedTags'] as List)?.map((e) => e as String)?.toList(),
    json['change_seq'] as int,
    json['flags'] == null
        ? null
        : PostFlags.fromJson(json['flags'] as Map<String, dynamic>),
    json['rating'] as String,
    json['fav_count'] as int,
    (json['sources'] as List)?.map((e) => e as String)?.toList(),
    json['pools'] as List,
    json['relationships'] == null
        ? null
        : PostRelationship.fromJson(
            json['relationships'] as Map<String, dynamic>),
    json['approver_id'] as int,
    json['uploader_id'] as int,
    json['description'] as String,
    json['comment_count'] as int,
    json['is_favorited'] as bool,
  );
}

Map<String, dynamic> _$PostListItemToJson(PostListItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'file': instance.file,
      'preview': instance.preview,
      'sample': instance.sample,
      'score': instance.score,
      'tags': instance.tags,
      'lockedTags': instance.lockedTags,
      'change_seq': instance.changeSeq,
      'flags': instance.flags,
      'rating': instance.rating,
      'fav_count': instance.favCount,
      'sources': instance.sources,
      'pools': instance.pools,
      'relationships': instance.relationships,
      'approver_id': instance.approverId,
      'uploader_id': instance.uploaderId,
      'description': instance.description,
      'comment_count': instance.commentCount,
      'is_favorited': instance.isFavorited,
    };
