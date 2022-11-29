import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'all_materials_record.g.dart';

abstract class AllMaterialsRecord
    implements Built<AllMaterialsRecord, AllMaterialsRecordBuilder> {
  static Serializer<AllMaterialsRecord> get serializer =>
      _$allMaterialsRecordSerializer;

  DocumentReference? get owner;

  String? get status;

  String? get materialName;

  DateTime? get addedOn;

  BuiltList<DocumentReference>? get members;

  String? get description;

  DocumentReference? get projectRef;

  DateTime? get verifiedOn;

  bool? get verified;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AllMaterialsRecordBuilder builder) => builder
    ..status = ''
    ..materialName = ''
    ..members = ListBuilder()
    ..description = ''
    ..verified = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('allMaterials');

  static Stream<AllMaterialsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AllMaterialsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AllMaterialsRecord._();
  factory AllMaterialsRecord(
          [void Function(AllMaterialsRecordBuilder) updates]) =
      _$AllMaterialsRecord;

  static AllMaterialsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAllMaterialsRecordData({
  DocumentReference? owner,
  String? status,
  String? materialName,
  DateTime? addedOn,
  String? description,
  DocumentReference? projectRef,
  DateTime? verifiedOn,
  bool? verified,
}) {
  final firestoreData = serializers.toFirestore(
    AllMaterialsRecord.serializer,
    AllMaterialsRecord(
      (a) => a
        ..owner = owner
        ..status = status
        ..materialName = materialName
        ..addedOn = addedOn
        ..members = null
        ..description = description
        ..projectRef = projectRef
        ..verifiedOn = verifiedOn
        ..verified = verified,
    ),
  );

  return firestoreData;
}
