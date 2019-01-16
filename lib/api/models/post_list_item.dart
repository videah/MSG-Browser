import 'package:json_annotation/json_annotation.dart';

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
      this.tags,
      this.lockedTags,
      this.description,
      this.createdAt,
      this.creatorId,
      this.author,
      this.change,
      this.source,
      this.score,
      this.favCount,
      this.md5,
      this.fileSize,
      this.fileUrl,
      this.fileExt,
      this.previewUrl,
      this.previewWidth,
      this.previewHeight,
      this.sampleUrl,
      this.sampleWidth,
      this.sampleHeight,
      this.rating,
      this.status,
      this.width,
      this.height,
      this.hasComments,
      this.hasNotes,
      this.hasChildren,
      this.children,
      this.parentId,
      this.artist,
      this.sources,
      this.delreason);

  final int id;
  final String tags;
  @JsonKey(name: "locked_tags")
  final String lockedTags;
  final String description;
  @JsonKey(name: "created_at")
  final CreatedAt createdAt;
  @JsonKey(name: "creator_id")
  final int creatorId;
  final String author;
  final int change;
  final String source;
  final int score;
  @JsonKey(name: "fav_count")
  final int favCount;
  final String md5;
  @JsonKey(name: "file_size")
  final int fileSize;
  @JsonKey(name: "file_url")
  final String fileUrl;
  @JsonKey(name: "file_ext")
  final String fileExt;
  @JsonKey(name: "preview_url")
  final String previewUrl;
  @JsonKey(name: "preview_width")
  final int previewWidth;
  @JsonKey(name: "preview_height")
  final int previewHeight;
  @JsonKey(name: "sample_url")
  final String sampleUrl;
  @JsonKey(name: "sample_width")
  final int sampleWidth;
  @JsonKey(name: "sample_height")
  final int sampleHeight;
  final String rating;
  final String status;
  final int width;
  final int height;
  @JsonKey(name: "has_comments")
  final bool hasComments;
  @JsonKey(name: "has_notes")
  final bool hasNotes;
  @JsonKey(name: "has_children")
  final bool hasChildren;
  final String children;
  @JsonKey(name: "parent_id")
  final int parentId;
  final List<String> artist;
  final List<String> sources;
  final String delreason;

  Map<String, dynamic> toJson() => _$PostListItemToJson(this);
  factory PostListItem.fromJson(Map<String, dynamic> json) =>
      _$PostListItemFromJson(json);
}
