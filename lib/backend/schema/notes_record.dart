import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'notes_record.g.dart';

abstract class NotesRecord implements Built<NotesRecord, NotesRecordBuilder> {
  static Serializer<NotesRecord> get serializer => _$notesRecordSerializer;

  DocumentReference? get owner;

  String? get note;

  DateTime? get timePosted;

  DocumentReference? get matRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(NotesRecordBuilder builder) =>
      builder..note = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notes');

  static Stream<NotesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<NotesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  NotesRecord._();
  factory NotesRecord([void Function(NotesRecordBuilder) updates]) =
      _$NotesRecord;

  static NotesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createNotesRecordData({
  DocumentReference? owner,
  String? note,
  DateTime? timePosted,
  DocumentReference? matRef,
}) {
  final firestoreData = serializers.toFirestore(
    NotesRecord.serializer,
    NotesRecord(
      (n) => n
        ..owner = owner
        ..note = note
        ..timePosted = timePosted
        ..matRef = matRef,
    ),
  );

  return firestoreData;
}
