import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'location_posts_record.g.dart';

abstract class LocationPostsRecord
    implements Built<LocationPostsRecord, LocationPostsRecordBuilder> {
  static Serializer<LocationPostsRecord> get serializer =>
      _$locationPostsRecordSerializer;

  @nullable
  DateTime get postCreated;

  @nullable
  String get postLocation;

  @nullable
  DocumentReference get postUser;

  @nullable
  String get postUserImage;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(LocationPostsRecordBuilder builder) => builder
    ..postLocation = ''
    ..postUserImage = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('locationPosts');

  static Stream<LocationPostsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  LocationPostsRecord._();
  factory LocationPostsRecord(
          [void Function(LocationPostsRecordBuilder) updates]) =
      _$LocationPostsRecord;

  static LocationPostsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createLocationPostsRecordData({
  DateTime postCreated,
  String postLocation,
  DocumentReference postUser,
  String postUserImage,
}) =>
    serializers.toFirestore(
        LocationPostsRecord.serializer,
        LocationPostsRecord((l) => l
          ..postCreated = postCreated
          ..postLocation = postLocation
          ..postUser = postUser
          ..postUserImage = postUserImage));
