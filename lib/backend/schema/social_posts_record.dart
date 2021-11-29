import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'social_posts_record.g.dart';

abstract class SocialPostsRecord
    implements Built<SocialPostsRecord, SocialPostsRecordBuilder> {
  static Serializer<SocialPostsRecord> get serializer =>
      _$socialPostsRecordSerializer;

  @nullable
  DateTime get postCreated;

  @nullable
  String get postImage;

  @nullable
  String get postDescription;

  @nullable
  DocumentReference get postUser;

  @nullable
  String get postUserImage;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SocialPostsRecordBuilder builder) => builder
    ..postImage = ''
    ..postDescription = ''
    ..postUserImage = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('socialPosts');

  static Stream<SocialPostsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SocialPostsRecord._();
  factory SocialPostsRecord([void Function(SocialPostsRecordBuilder) updates]) =
      _$SocialPostsRecord;

  static SocialPostsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSocialPostsRecordData({
  DateTime postCreated,
  String postImage,
  String postDescription,
  DocumentReference postUser,
  String postUserImage,
}) =>
    serializers.toFirestore(
        SocialPostsRecord.serializer,
        SocialPostsRecord((s) => s
          ..postCreated = postCreated
          ..postImage = postImage
          ..postDescription = postDescription
          ..postUser = postUser
          ..postUserImage = postUserImage));
