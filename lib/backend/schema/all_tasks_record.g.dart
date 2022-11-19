// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_tasks_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AllTasksRecord> _$allTasksRecordSerializer =
    new _$AllTasksRecordSerializer();

class _$AllTasksRecordSerializer
    implements StructuredSerializer<AllTasksRecord> {
  @override
  final Iterable<Type> types = const [AllTasksRecord, _$AllTasksRecord];
  @override
  final String wireName = 'AllTasksRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AllTasksRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.taskName;
    if (value != null) {
      result
        ..add('taskName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dueDate;
    if (value != null) {
      result
        ..add('dueDate')
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
    value = object.completed;
    if (value != null) {
      result
        ..add('completed')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
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
    value = object.projectRef;
    if (value != null) {
      result
        ..add('projectRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.completedAt;
    if (value != null) {
      result
        ..add('completedAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  AllTasksRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AllTasksRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'taskName':
          result.taskName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dueDate':
          result.dueDate = serializers.deserialize(value,
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
        case 'completed':
          result.completed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
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
        case 'projectRef':
          result.projectRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'completedAt':
          result.completedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$AllTasksRecord extends AllTasksRecord {
  @override
  final String? taskName;
  @override
  final DateTime? dueDate;
  @override
  final BuiltList<DocumentReference<Object?>>? members;
  @override
  final String? description;
  @override
  final bool? completed;
  @override
  final DocumentReference<Object?>? owner;
  @override
  final String? status;
  @override
  final DocumentReference<Object?>? projectRef;
  @override
  final DateTime? completedAt;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AllTasksRecord([void Function(AllTasksRecordBuilder)? updates]) =>
      (new AllTasksRecordBuilder()..update(updates))._build();

  _$AllTasksRecord._(
      {this.taskName,
      this.dueDate,
      this.members,
      this.description,
      this.completed,
      this.owner,
      this.status,
      this.projectRef,
      this.completedAt,
      this.ffRef})
      : super._();

  @override
  AllTasksRecord rebuild(void Function(AllTasksRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AllTasksRecordBuilder toBuilder() =>
      new AllTasksRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AllTasksRecord &&
        taskName == other.taskName &&
        dueDate == other.dueDate &&
        members == other.members &&
        description == other.description &&
        completed == other.completed &&
        owner == other.owner &&
        status == other.status &&
        projectRef == other.projectRef &&
        completedAt == other.completedAt &&
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
                                    $jc($jc(0, taskName.hashCode),
                                        dueDate.hashCode),
                                    members.hashCode),
                                description.hashCode),
                            completed.hashCode),
                        owner.hashCode),
                    status.hashCode),
                projectRef.hashCode),
            completedAt.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AllTasksRecord')
          ..add('taskName', taskName)
          ..add('dueDate', dueDate)
          ..add('members', members)
          ..add('description', description)
          ..add('completed', completed)
          ..add('owner', owner)
          ..add('status', status)
          ..add('projectRef', projectRef)
          ..add('completedAt', completedAt)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AllTasksRecordBuilder
    implements Builder<AllTasksRecord, AllTasksRecordBuilder> {
  _$AllTasksRecord? _$v;

  String? _taskName;
  String? get taskName => _$this._taskName;
  set taskName(String? taskName) => _$this._taskName = taskName;

  DateTime? _dueDate;
  DateTime? get dueDate => _$this._dueDate;
  set dueDate(DateTime? dueDate) => _$this._dueDate = dueDate;

  ListBuilder<DocumentReference<Object?>>? _members;
  ListBuilder<DocumentReference<Object?>> get members =>
      _$this._members ??= new ListBuilder<DocumentReference<Object?>>();
  set members(ListBuilder<DocumentReference<Object?>>? members) =>
      _$this._members = members;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  bool? _completed;
  bool? get completed => _$this._completed;
  set completed(bool? completed) => _$this._completed = completed;

  DocumentReference<Object?>? _owner;
  DocumentReference<Object?>? get owner => _$this._owner;
  set owner(DocumentReference<Object?>? owner) => _$this._owner = owner;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  DocumentReference<Object?>? _projectRef;
  DocumentReference<Object?>? get projectRef => _$this._projectRef;
  set projectRef(DocumentReference<Object?>? projectRef) =>
      _$this._projectRef = projectRef;

  DateTime? _completedAt;
  DateTime? get completedAt => _$this._completedAt;
  set completedAt(DateTime? completedAt) => _$this._completedAt = completedAt;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AllTasksRecordBuilder() {
    AllTasksRecord._initializeBuilder(this);
  }

  AllTasksRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _taskName = $v.taskName;
      _dueDate = $v.dueDate;
      _members = $v.members?.toBuilder();
      _description = $v.description;
      _completed = $v.completed;
      _owner = $v.owner;
      _status = $v.status;
      _projectRef = $v.projectRef;
      _completedAt = $v.completedAt;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AllTasksRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AllTasksRecord;
  }

  @override
  void update(void Function(AllTasksRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AllTasksRecord build() => _build();

  _$AllTasksRecord _build() {
    _$AllTasksRecord _$result;
    try {
      _$result = _$v ??
          new _$AllTasksRecord._(
              taskName: taskName,
              dueDate: dueDate,
              members: _members?.build(),
              description: description,
              completed: completed,
              owner: owner,
              status: status,
              projectRef: projectRef,
              completedAt: completedAt,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'members';
        _members?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AllTasksRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
