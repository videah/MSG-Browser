import 'package:json_annotation/json_annotation.dart';
import 'post_arrays.dart';

part 'post_list_item.g.dart';

@JsonSerializable()
class CreatedAt {
  CreatedAt(this.jsonClass, this.s, this.n);

  @JsonKey(name: "json_class")
  final String jsonClass;
  final int s;
  final int n;

  Map<String, dynamic> toJson() => _$CreatedAtToJson(this);
  factory CreatedAt.fromJson(Map<String, dynamic> json) =>
      _$CreatedAtFromJson(json);
}

@JsonSerializable()
class PostListItem {
  PostListItem(
    this.id,
    this.createdAt,
    this.updatedAt,
    this.file,
    this.preview,
    this.sample,
    this.score,
    this.tags,
    this.lockedTags,
    this.changeSeq,
    this.flags,
    this.rating,
    this.favCount,
    this.sources,
    this.pools,
    this.relationships,
    this.approverId,
    this.uploaderId,
    this.description,
    this.commentCount,
    this.isFavorited,
  );

  final int id;
  @JsonKey(name: "created_at")
  final String createdAt;
  @JsonKey(name: "updated_at")
  final String updatedAt;
  final PostFile file;
  final PostPreview preview;
  final PostSample sample;
  final PostScore score;
  final PostTags tags;
  @JsonKey(name: "lockedTags")
  final List<String> lockedTags;
  @JsonKey(name: "change_seq")
  final int changeSeq;
  final PostFlags flags;
  final String rating;
  @JsonKey(name: "fav_count")
  final int favCount;
  final List<String> sources;
  final List pools;
  final PostRelationship relationships;
  @JsonKey(name: "approver_id")
  final int approverId;
  @JsonKey(name: "uploader_id")
  final int uploaderId;
  final String description;
  @JsonKey(name: "comment_count")
  final int commentCount;
  @JsonKey(name: "is_favorited")
  final bool isFavorited;

  Map<String, dynamic> toJson() => _$PostListItemToJson(this);
  factory PostListItem.fromJson(Map<String, dynamic> json) =>
      _$PostListItemFromJson(json);
}
