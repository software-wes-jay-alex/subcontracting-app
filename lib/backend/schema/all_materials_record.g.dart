// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_materials_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AllMaterialsRecord> _$allMaterialsRecordSerializer =
    new _$AllMaterialsRecordSerializer();

class _$AllMaterialsRecordSerializer
    implements StructuredSerializer<AllMaterialsRecord> {
  @override
  final Iterable<Type> types = const [AllMaterialsRecord, _$AllMaterialsRecord];
  @override
  final String wireName = 'AllMaterialsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AllMaterialsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.owner;
    if (value != null) {
      result
        ..add('owner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.materialName;
    if (value != null) {
      result
        ..add('materialName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.addedOn;
    if (value != null) {
      result
        ..add('addedOn')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.members;
    if (value != null) {
      result
        ..add('members')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.projectRef;
    if (value != null) {
      result
        ..add('projectRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.verifiedOn;
    if (value != null) {
      result
        ..add('verifiedOn')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.verified;
    if (value != null) {
      result
        ..add('verified')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  AllMaterialsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AllMaterialsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'materialName':
          result.materialName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'addedOn':
          result.addedOn = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'members':
          result.members.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'projectRef':
          result.projectRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'verifiedOn':
          result.verifiedOn = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'verified':
          result.verified = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$AllMaterialsRecord extends AllMaterialsRecord {
  @override
  final DocumentReference<Object?>? owner;
  @override
  final String? status;
  @override
  final String? materialName;
  @override
  final DateTime? addedOn;
  @override
  final BuiltList<DocumentReference<Object?>>? members;
  @override
  final String? description;
  @override
  final DocumentReference<Object?>? projectRef;
  @override
  final DateTime? verifiedOn;
  @override
  final bool? verified;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AllMaterialsRecord(
          [void Function(AllMaterialsRecordBuilder)? updates]) =>
      (new AllMaterialsRecordBuilder()..update(updates))._build();

  _$AllMaterialsRecord._(
      {this.owner,
      this.status,
      this.materialName,
      this.addedOn,
      this.members,
      this.description,
      this.projectRef,
      this.verifiedOn,
      this.verified,
      this.ffRef})
      : super._();

  @override
  AllMaterialsRecord rebuild(
          void Function(AllMaterialsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AllMaterialsRecordBuilder toBuilder() =>
      new AllMaterialsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AllMaterialsRecord &&
        owner == other.owner &&
        status == other.status &&
        materialName == other.materialName &&
        addedOn == other.addedOn &&
        members == other.members &&
        description == other.description &&
        projectRef == other.projectRef &&
        verifiedOn == other.verifiedOn &&
        verified == other.verified &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, owner.hashCode),
                                        status.hashCode),
                                    materialName.hashCode),
                                addedOn.hashCode),
                            members.hashCode),
                        description.hashCode),
                    projectRef.hashCode),
                verifiedOn.hashCode),
            verified.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AllMaterialsRecord')
          ..add('owner', owner)
          ..add('status', status)
          ..add('materialName', materialName)
          ..add('addedOn', addedOn)
          ..add('members', members)
          ..add('description', description)
          ..add('projectRef', projectRef)
          ..add('verifiedOn', verifiedOn)
          ..add('verified', verified)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AllMaterialsRecordBuilder
    implements Builder<AllMaterialsRecord, AllMaterialsRecordBuilder> {
  _$AllMaterialsRecord? _$v;

  DocumentReference<Object?>? _owner;
  DocumentReference<Object?>? get owner => _$this._owner;
  set owner(DocumentReference<Object?>? owner) => _$this._owner = owner;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _materialName;
  String? get materialName => _$this._materialName;
  set materialName(String? materialName) => _$this._materialName = materialName;

  DateTime? _addedOn;
  DateTime? get addedOn => _$this._addedOn;
  set addedOn(DateTime? addedOn) => _$this._addedOn = addedOn;

  ListBuilder<DocumentReference<Object?>>? _members;
  ListBuilder<DocumentReference<Object?>> get members =>
      _$this._members ??= new ListBuilder<DocumentReference<Object?>>();
  set members(ListBuilder<DocumentReference<Object?>>? members) =>
      _$this._members = members;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DocumentReference<Object?>? _projectRef;
  DocumentReference<Object?>? get projectRef => _$this._projectRef;
  set projectRef(DocumentReference<Object?>? projectRef) =>
      _$this._projectRef = projectRef;

  DateTime? _verifiedOn;
  DateTime? get verifiedOn => _$this._verifiedOn;
  set verifiedOn(DateTime? verifiedOn) => _$this._verifiedOn = verifiedOn;

  bool? _verified;
  bool? get verified => _$this._verified;
  set verified(bool? verified) => _$this._verified = verified;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AllMaterialsRecordBuilder() {
    AllMaterialsRecord._initializeBuilder(this);
  }

  AllMaterialsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _owner = $v.owner;
      _status = $v.status;
      _materialName = $v.materialName;
      _addedOn = $v.addedOn;
      _members = $v.members?.toBuilder();
      _description = $v.description;
      _projectRef = $v.projectRef;
      _verifiedOn = $v.verifiedOn;
      _verified = $v.verified;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AllMaterialsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AllMaterialsRecord;
  }

  @override
  void update(void Function(AllMaterialsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AllMaterialsRecord build() => _build();

  _$AllMaterialsRecord _build() {
    _$AllMaterialsRecord _$result;
    try {
      _$result = _$v ??
          new _$AllMaterialsRecord._(
              owner: owner,
              status: status,
              materialName: materialName,
              addedOn: addedOn,
              members: _members?.build(),
              description: description,
              projectRef: projectRef,
              verifiedOn: verifiedOn,
              verified: verified,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'members';
        _members?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AllMaterialsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
