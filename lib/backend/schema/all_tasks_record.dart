import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'all_tasks_record.g.dart';

abstract class AllTasksRecord
    implements Built<AllTasksRecord, AllTasksRecordBuilder> {
  static Serializer<AllTasksRecord> get serializer =>
      _$allTasksRecordSerializer;

  String? get taskName;

  DateTime? get dueDate;

  BuiltList<DocumentReference>? get members;

  String? get description;

  bool? get completed;

  DocumentReference? get owner;

  String? get status;

  DocumentReference? get projectRef;

  DateTime? get completedAt;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AllTasksRecordBuilder builder) => builder
    ..taskName = ''
    ..members = ListBuilder()
    ..description = ''
    ..completed = false
    ..status = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('allTasks');

  static Stream<AllTasksRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AllTasksRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AllTasksRecord._();
  factory AllTasksRecord([void Function(AllTasksRecordBuilder) updates]) =
      _$AllTasksRecord;

  static AllTasksRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAllTasksRecordData({
  String? taskName,
  DateTime? dueDate,
  String? description,
  bool? completed,
  DocumentReference? owner,
  String? status,
  DocumentReference? projectRef,
  DateTime? completedAt,
}) {
  final firestoreData = serializers.toFirestore(
    AllTasksRecord.serializer,
    AllTasksRecord(
      (a) => a
        ..taskName = taskName
        ..dueDate = dueDate
        ..members = null
        ..description = description
        ..completed = completed
        ..owner = owner
        ..status = status
        ..projectRef = projectRef
        ..completedAt = completedAt,
    ),
  );

  return firestoreData;
}
