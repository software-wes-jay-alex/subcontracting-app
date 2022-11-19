import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'project_list_record.g.dart';

abstract class ProjectListRecord
    implements Built<ProjectListRecord, ProjectListRecordBuilder> {
  static Serializer<ProjectListRecord> get serializer =>
      _$projectListRecordSerializer;

  BuiltList<String>? get projects;

  DocumentReference? get userRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ProjectListRecordBuilder builder) =>
      builder..projects = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('projectList');

  static Stream<ProjectListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ProjectListRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ProjectListRecord._();
  factory ProjectListRecord([void Function(ProjectListRecordBuilder) updates]) =
      _$ProjectListRecord;

  static ProjectListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createProjectListRecordData({
  DocumentReference? userRef,
}) {
  final firestoreData = serializers.toFirestore(
    ProjectListRecord.serializer,
    ProjectListRecord(
      (p) => p
        ..projects = null
        ..userRef = userRef,
    ),
  );

  return firestoreData;
}
