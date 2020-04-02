import 'package:json_annotation/json_annotation.dart';

part 'post_arrays.g.dart';

@JsonSerializable()
class PostFile {
  PostFile(
    this.width,
    this.height,
    this.extension,
    this.size,
    this.md5,
    this.url,
  );

  final int width;
  final int height;
  final String extension;
  final int size;
  final String md5;
  final String url;

  Map<String, dynamic> toJson() => _$PostFileToJson(this);
  factory PostFile.fromJson(Map<String, dynamic> json) =>
      _$PostFileFromJson(json);
}

@JsonSerializable()
class PostPreview {
  PostPreview(
    this.width,
    this.height,
    this.url,
  );

  final int width;
  final int height;
  final String url;

  Map<String, dynamic> toJson() => _$PostPreviewToJson(this);
  factory PostPreview.fromJson(Map<String, dynamic> json) =>
      _$PostPreviewFromJson(json);
}

@JsonSerializable()
class PostSample {
  PostSample(
    this.hasThumbnail,
    this.width,
    this.height,
    this.url,
  );

  @JsonKey(name: "has")
  final bool hasThumbnail;
  final int width;
  final int height;
  final String url;

  Map<String, dynamic> toJson() => _$PostSampleToJson(this);
  factory PostSample.fromJson(Map<String, dynamic> json) =>
      _$PostSampleFromJson(json);
}

@JsonSerializable()
class PostTags {
  PostTags(
    this.general,
    this.species,
    this.character,
    this.artist,
    this.invalid,
    this.lore,
    this.meta,
  );

  final List<String> general;
  final List<String> species;
  final List<String> character;
  final List<String> artist;
  final List<String> invalid;
  final List<String> lore;
  final List<String> meta;

  Map<String, dynamic> toJson() => _$PostTagsToJson(this);
  factory PostTags.fromJson(Map<String, dynamic> json) =>
      _$PostTagsFromJson(json);
}

@JsonSerializable()
class PostFlags {
  PostFlags(
    this.pending,
    this.flagged,
    this.noteLocked,
    this.statusLocked,
    this.ratingLocked,
    this.deleted,
  );

  final bool pending;
  final bool flagged;
  @JsonKey(name: "note_locked")
  final bool noteLocked;
  @JsonKey(name: "status_locked")
  final bool statusLocked;
  @JsonKey(name: "rating_locked")
  final bool ratingLocked;
  final bool deleted;

  Map<String, dynamic> toJson() => _$PostFlagsToJson(this);
  factory PostFlags.fromJson(Map<String, dynamic> json) =>
      _$PostFlagsFromJson(json);
}

@JsonSerializable()
class PostRelationship {
  PostRelationship(
    this.parentId,
    this.hasChildren,
    this.hasActiveChildren,
    this.children,
  );

  @JsonKey(name: "parent_id")
  final int parentId;
  @JsonKey(name: "has_children")
  final bool hasChildren;
  @JsonKey(name: "has_active_children")
  final bool hasActiveChildren;
  final List<int> children;

  Map<String, dynamic> toJson() => _$PostRelationshipToJson(this);
  factory PostRelationship.fromJson(Map<String, dynamic> json) =>
      _$PostRelationshipFromJson(json);
}

@JsonSerializable()
class PostScore {
  PostScore(this.up, this.down, this.total);

  final int up;
  final int down;
  final int total;

  Map<String, dynamic> toJson() => _$PostScoreToJson(this);
  factory PostScore.fromJson(Map<String, dynamic> json) =>
      _$PostScoreFromJson(json);
}
