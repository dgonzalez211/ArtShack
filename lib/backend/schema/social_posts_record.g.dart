// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_posts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SocialPostsRecord> _$socialPostsRecordSerializer =
    new _$SocialPostsRecordSerializer();

class _$SocialPostsRecordSerializer
    implements StructuredSerializer<SocialPostsRecord> {
  @override
  final Iterable<Type> types = const [SocialPostsRecord, _$SocialPostsRecord];
  @override
  final String wireName = 'SocialPostsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, SocialPostsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.postCreated;
    if (value != null) {
      result
        ..add('postCreated')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.postImage;
    if (value != null) {
      result
        ..add('postImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postDescription;
    if (value != null) {
      result
        ..add('postDescription')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postUser;
    if (value != null) {
      result
        ..add('postUser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.postUserImage;
    if (value != null) {
      result
        ..add('postUserImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  SocialPostsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SocialPostsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'postCreated':
          result.postCreated = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'postImage':
          result.postImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'postDescription':
          result.postDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'postUser':
          result.postUser = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'postUserImage':
          result.postUserImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$SocialPostsRecord extends SocialPostsRecord {
  @override
  final DateTime postCreated;
  @override
  final String postImage;
  @override
  final String postDescription;
  @override
  final DocumentReference<Object> postUser;
  @override
  final String postUserImage;
  @override
  final DocumentReference<Object> reference;

  factory _$SocialPostsRecord(
          [void Function(SocialPostsRecordBuilder) updates]) =>
      (new SocialPostsRecordBuilder()..update(updates)).build();

  _$SocialPostsRecord._(
      {this.postCreated,
      this.postImage,
      this.postDescription,
      this.postUser,
      this.postUserImage,
      this.reference})
      : super._();

  @override
  SocialPostsRecord rebuild(void Function(SocialPostsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SocialPostsRecordBuilder toBuilder() =>
      new SocialPostsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SocialPostsRecord &&
        postCreated == other.postCreated &&
        postImage == other.postImage &&
        postDescription == other.postDescription &&
        postUser == other.postUser &&
        postUserImage == other.postUserImage &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, postCreated.hashCode), postImage.hashCode),
                    postDescription.hashCode),
                postUser.hashCode),
            postUserImage.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SocialPostsRecord')
          ..add('postCreated', postCreated)
          ..add('postImage', postImage)
          ..add('postDescription', postDescription)
          ..add('postUser', postUser)
          ..add('postUserImage', postUserImage)
          ..add('reference', reference))
        .toString();
  }
}

class SocialPostsRecordBuilder
    implements Builder<SocialPostsRecord, SocialPostsRecordBuilder> {
  _$SocialPostsRecord _$v;

  DateTime _postCreated;
  DateTime get postCreated => _$this._postCreated;
  set postCreated(DateTime postCreated) => _$this._postCreated = postCreated;

  String _postImage;
  String get postImage => _$this._postImage;
  set postImage(String postImage) => _$this._postImage = postImage;

  String _postDescription;
  String get postDescription => _$this._postDescription;
  set postDescription(String postDescription) =>
      _$this._postDescription = postDescription;

  DocumentReference<Object> _postUser;
  DocumentReference<Object> get postUser => _$this._postUser;
  set postUser(DocumentReference<Object> postUser) =>
      _$this._postUser = postUser;

  String _postUserImage;
  String get postUserImage => _$this._postUserImage;
  set postUserImage(String postUserImage) =>
      _$this._postUserImage = postUserImage;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  SocialPostsRecordBuilder() {
    SocialPostsRecord._initializeBuilder(this);
  }

  SocialPostsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _postCreated = $v.postCreated;
      _postImage = $v.postImage;
      _postDescription = $v.postDescription;
      _postUser = $v.postUser;
      _postUserImage = $v.postUserImage;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SocialPostsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SocialPostsRecord;
  }

  @override
  void update(void Function(SocialPostsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SocialPostsRecord build() {
    final _$result = _$v ??
        new _$SocialPostsRecord._(
            postCreated: postCreated,
            postImage: postImage,
            postDescription: postDescription,
            postUser: postUser,
            postUserImage: postUserImage,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
