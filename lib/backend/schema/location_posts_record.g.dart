// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_posts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LocationPostsRecord> _$locationPostsRecordSerializer =
    new _$LocationPostsRecordSerializer();

class _$LocationPostsRecordSerializer
    implements StructuredSerializer<LocationPostsRecord> {
  @override
  final Iterable<Type> types = const [
    LocationPostsRecord,
    _$LocationPostsRecord
  ];
  @override
  final String wireName = 'LocationPostsRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, LocationPostsRecord object,
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
    value = object.postLocation;
    if (value != null) {
      result
        ..add('postLocation')
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
  LocationPostsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LocationPostsRecordBuilder();

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
        case 'postLocation':
          result.postLocation = serializers.deserialize(value,
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

class _$LocationPostsRecord extends LocationPostsRecord {
  @override
  final DateTime postCreated;
  @override
  final String postLocation;
  @override
  final DocumentReference<Object> postUser;
  @override
  final String postUserImage;
  @override
  final DocumentReference<Object> reference;

  factory _$LocationPostsRecord(
          [void Function(LocationPostsRecordBuilder) updates]) =>
      (new LocationPostsRecordBuilder()..update(updates)).build();

  _$LocationPostsRecord._(
      {this.postCreated,
      this.postLocation,
      this.postUser,
      this.postUserImage,
      this.reference})
      : super._();

  @override
  LocationPostsRecord rebuild(
          void Function(LocationPostsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LocationPostsRecordBuilder toBuilder() =>
      new LocationPostsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LocationPostsRecord &&
        postCreated == other.postCreated &&
        postLocation == other.postLocation &&
        postUser == other.postUser &&
        postUserImage == other.postUserImage &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, postCreated.hashCode), postLocation.hashCode),
                postUser.hashCode),
            postUserImage.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LocationPostsRecord')
          ..add('postCreated', postCreated)
          ..add('postLocation', postLocation)
          ..add('postUser', postUser)
          ..add('postUserImage', postUserImage)
          ..add('reference', reference))
        .toString();
  }
}

class LocationPostsRecordBuilder
    implements Builder<LocationPostsRecord, LocationPostsRecordBuilder> {
  _$LocationPostsRecord _$v;

  DateTime _postCreated;
  DateTime get postCreated => _$this._postCreated;
  set postCreated(DateTime postCreated) => _$this._postCreated = postCreated;

  String _postLocation;
  String get postLocation => _$this._postLocation;
  set postLocation(String postLocation) => _$this._postLocation = postLocation;

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

  LocationPostsRecordBuilder() {
    LocationPostsRecord._initializeBuilder(this);
  }

  LocationPostsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _postCreated = $v.postCreated;
      _postLocation = $v.postLocation;
      _postUser = $v.postUser;
      _postUserImage = $v.postUserImage;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LocationPostsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LocationPostsRecord;
  }

  @override
  void update(void Function(LocationPostsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LocationPostsRecord build() {
    final _$result = _$v ??
        new _$LocationPostsRecord._(
            postCreated: postCreated,
            postLocation: postLocation,
            postUser: postUser,
            postUserImage: postUserImage,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
