// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repository_issue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RepositoryIssue _$RepositoryIssueFromJson(Map<String, dynamic> json) {
  return _RepositoryIssue.fromJson(json);
}

/// @nodoc
mixin _$RepositoryIssue {
  int get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  int get comments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepositoryIssueCopyWith<RepositoryIssue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepositoryIssueCopyWith<$Res> {
  factory $RepositoryIssueCopyWith(
          RepositoryIssue value, $Res Function(RepositoryIssue) then) =
      _$RepositoryIssueCopyWithImpl<$Res, RepositoryIssue>;
  @useResult
  $Res call({int id, String? title, String? body, String state, int comments});
}

/// @nodoc
class _$RepositoryIssueCopyWithImpl<$Res, $Val extends RepositoryIssue>
    implements $RepositoryIssueCopyWith<$Res> {
  _$RepositoryIssueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? body = freezed,
    Object? state = null,
    Object? comments = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RepositoryIssueCopyWith<$Res>
    implements $RepositoryIssueCopyWith<$Res> {
  factory _$$_RepositoryIssueCopyWith(
          _$_RepositoryIssue value, $Res Function(_$_RepositoryIssue) then) =
      __$$_RepositoryIssueCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? title, String? body, String state, int comments});
}

/// @nodoc
class __$$_RepositoryIssueCopyWithImpl<$Res>
    extends _$RepositoryIssueCopyWithImpl<$Res, _$_RepositoryIssue>
    implements _$$_RepositoryIssueCopyWith<$Res> {
  __$$_RepositoryIssueCopyWithImpl(
      _$_RepositoryIssue _value, $Res Function(_$_RepositoryIssue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? body = freezed,
    Object? state = null,
    Object? comments = null,
  }) {
    return _then(_$_RepositoryIssue(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RepositoryIssue implements _RepositoryIssue {
  const _$_RepositoryIssue(
      {required this.id,
      required this.title,
      required this.body,
      required this.state,
      required this.comments});

  factory _$_RepositoryIssue.fromJson(Map<String, dynamic> json) =>
      _$$_RepositoryIssueFromJson(json);

  @override
  final int id;
  @override
  final String? title;
  @override
  final String? body;
  @override
  final String state;
  @override
  final int comments;

  @override
  String toString() {
    return 'RepositoryIssue(id: $id, title: $title, body: $body, state: $state, comments: $comments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RepositoryIssue &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.comments, comments) ||
                other.comments == comments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, body, state, comments);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RepositoryIssueCopyWith<_$_RepositoryIssue> get copyWith =>
      __$$_RepositoryIssueCopyWithImpl<_$_RepositoryIssue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RepositoryIssueToJson(
      this,
    );
  }
}

abstract class _RepositoryIssue implements RepositoryIssue {
  const factory _RepositoryIssue(
      {required final int id,
      required final String? title,
      required final String? body,
      required final String state,
      required final int comments}) = _$_RepositoryIssue;

  factory _RepositoryIssue.fromJson(Map<String, dynamic> json) =
      _$_RepositoryIssue.fromJson;

  @override
  int get id;
  @override
  String? get title;
  @override
  String? get body;
  @override
  String get state;
  @override
  int get comments;
  @override
  @JsonKey(ignore: true)
  _$$_RepositoryIssueCopyWith<_$_RepositoryIssue> get copyWith =>
      throw _privateConstructorUsedError;
}
