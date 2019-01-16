// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatedAt _$CreatedAtFromJson(Map<String, dynamic> json) {
  return CreatedAt(
      json['json_class'] as String, json['s'] as int, json['n'] as int);
}

Map<String, dynamic> _$CreatedAtToJson(CreatedAt instance) => <String, dynamic>{
      'json_class': instance.jsonClass,
      's': instance.s,
      'n': instance.n
    };

PostListItem _$PostListItemFromJson(Map<String, dynamic> json) {
  return PostListItem(
      json['id'] as int,
      json['tags'] as String,
      json['locked_tags'] as String,
      json['description'] as String,
      json['created_at'] == null
          ? null
          : CreatedAt.fromJson(json['created_at'] as Map<String, dynamic>),
      json['creator_id'] as int,
      json['author'] as String,
      json['change'] as int,
      json['source'] as String,
      json['score'] as int,
      json['fav_count'] as int,
      json['md5'] as String,
      json['file_size'] as int,
      json['file_url'] as String,
      json['file_ext'] as String,
      json['preview_url'] as String,
      json['preview_width'] as int,
      json['preview_height'] as int,
      json['sample_url'] as String,
      json['sample_width'] as int,
      json['sample_height'] as int,
      json['rating'] as String,
      json['status'] as String,
      json['width'] as int,
      json['height'] as int,
      json['has_comments'] as bool,
      json['has_notes'] as bool,
      json['has_children'] as bool,
      json['children'] as String,
      json['parent_id'] as int,
      (json['artist'] as List)?.map((e) => e as String)?.toList(),
      (json['sources'] as List)?.map((e) => e as String)?.toList(),
      json['delreason'] as String);
}

Map<String, dynamic> _$PostListItemToJson(PostListItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tags': instance.tags,
      'locked_tags': instance.lockedTags,
      'description': instance.description,
      'created_at': instance.createdAt,
      'creator_id': instance.creatorId,
      'author': instance.author,
      'change': instance.change,
      'source': instance.source,
      'score': instance.score,
      'fav_count': instance.favCount,
      'md5': instance.md5,
      'file_size': instance.fileSize,
      'file_url': instance.fileUrl,
      'file_ext': instance.fileExt,
      'preview_url': instance.previewUrl,
      'preview_width': instance.previewWidth,
      'preview_height': instance.previewHeight,
      'sample_url': instance.sampleUrl,
      'sample_width': instance.sampleWidth,
      'sample_height': instance.sampleHeight,
      'rating': instance.rating,
      'status': instance.status,
      'width': instance.width,
      'height': instance.height,
      'has_comments': instance.hasComments,
      'has_notes': instance.hasNotes,
      'has_children': instance.hasChildren,
      'children': instance.children,
      'parent_id': instance.parentId,
      'artist': instance.artist,
      'sources': instance.sources,
      'delreason': instance.delreason
    };
