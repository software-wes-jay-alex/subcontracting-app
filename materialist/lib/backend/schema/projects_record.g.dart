// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProjectsRecord> _$projectsRecordSerializer =
    new _$ProjectsRecordSerializer();

class _$ProjectsRecordSerializer
    implements StructuredSerializer<ProjectsRecord> {
  @override
  final Iterable<Type> types = const [ProjectsRecord, _$ProjectsRecord];
  @override
  final String wireName = 'ProjectsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProjectsRecord object,
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
    value = object.usersAssigned;
    if (value != null) {
      result
        ..add('usersAssigned')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.projectName;
    if (value != null) {
      result
        ..add('projectName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.numberTasks;
    if (value != null) {
      result
        ..add('numberTasks')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.completedTasks;
    if (value != null) {
      result
        ..add('completedTasks')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.lastEdited;
    if (value != null) {
      result
        ..add('lastEdited')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.timeCreated;
    if (value != null) {
      result
        ..add('timeCreated')
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
  ProjectsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProjectsRecordBuilder();

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
        case 'usersAssigned':
          result.usersAssigned.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'projectName':
          result.projectName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'numberTasks':
          result.numberTasks = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'completedTasks':
          result.completedTasks = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'lastEdited':
          result.lastEdited = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'timeCreated':
          result.timeCreated = serializers.deserialize(value,
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

class _$ProjectsRecord extends ProjectsRecord {
  @override
  final DocumentReference<Object?>? owner;
  @override
  final BuiltList<DocumentReference<Object?>>? usersAssigned;
  @override
  final String? projectName;
  @override
  final String? description;
  @override
  final int? numberTasks;
  @override
  final int? completedTasks;
  @override
  final DateTime? lastEdited;
  @override
  final DateTime? timeCreated;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ProjectsRecord([void Function(ProjectsRecordBuilder)? updates]) =>
      (new ProjectsRecordBuilder()..update(updates))._build();

  _$ProjectsRecord._(
      {this.owner,
      this.usersAssigned,
      this.projectName,
      this.description,
      this.numberTasks,
      this.completedTasks,
      this.lastEdited,
      this.timeCreated,
      this.ffRef})
      : super._();

  @override
  ProjectsRecord rebuild(void Function(ProjectsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProjectsRecordBuilder toBuilder() =>
      new ProjectsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProjectsRecord &&
        owner == other.owner &&
        usersAssigned == other.usersAssigned &&
        projectName == other.projectName &&
        description == other.description &&
        numberTasks == other.numberTasks &&
        completedTasks == other.completedTasks &&
        lastEdited == other.lastEdited &&
        timeCreated == other.timeCreated &&
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
                                $jc($jc(0, owner.hashCode),
                                    usersAssigned.hashCode),
                                projectName.hashCode),
                            description.hashCode),
                        numberTasks.hashCode),
                    completedTasks.hashCode),
                lastEdited.hashCode),
            timeCreated.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProjectsRecord')
          ..add('owner', owner)
          ..add('usersAssigned', usersAssigned)
          ..add('projectName', projectName)
          ..add('description', description)
          ..add('numberTasks', numberTasks)
          ..add('completedTasks', completedTasks)
          ..add('lastEdited', lastEdited)
          ..add('timeCreated', timeCreated)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ProjectsRecordBuilder
    implements Builder<ProjectsRecord, ProjectsRecordBuilder> {
  _$ProjectsRecord? _$v;

  DocumentReference<Object?>? _owner;
  DocumentReference<Object?>? get owner => _$this._owner;
  set owner(DocumentReference<Object?>? owner) => _$this._owner = owner;

  ListBuilder<DocumentReference<Object?>>? _usersAssigned;
  ListBuilder<DocumentReference<Object?>> get usersAssigned =>
      _$this._usersAssigned ??= new ListBuilder<DocumentReference<Object?>>();
  set usersAssigned(ListBuilder<DocumentReference<Object?>>? usersAssigned) =>
      _$this._usersAssigned = usersAssigned;

  String? _projectName;
  String? get projectName => _$this._projectName;
  set projectName(String? projectName) => _$this._projectName = projectName;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  int? _numberTasks;
  int? get numberTasks => _$this._numberTasks;
  set numberTasks(int? numberTasks) => _$this._numberTasks = numberTasks;

  int? _completedTasks;
  int? get completedTasks => _$this._completedTasks;
  set completedTasks(int? completedTasks) =>
      _$this._completedTasks = completedTasks;

  DateTime? _lastEdited;
  DateTime? get lastEdited => _$this._lastEdited;
  set lastEdited(DateTime? lastEdited) => _$this._lastEdited = lastEdited;

  DateTime? _timeCreated;
  DateTime? get timeCreated => _$this._timeCreated;
  set timeCreated(DateTime? timeCreated) => _$this._timeCreated = timeCreated;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ProjectsRecordBuilder() {
    ProjectsRecord._initializeBuilder(this);
  }

  ProjectsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _owner = $v.owner;
      _usersAssigned = $v.usersAssigned?.toBuilder();
      _projectName = $v.projectName;
      _description = $v.description;
      _numberTasks = $v.numberTasks;
      _completedTasks = $v.completedTasks;
      _lastEdited = $v.lastEdited;
      _timeCreated = $v.timeCreated;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProjectsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProjectsRecord;
  }

  @override
  void update(void Function(ProjectsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProjectsRecord build() => _build();

  _$ProjectsRecord _build() {
    _$ProjectsRecord _$result;
    try {
      _$result = _$v ??
          new _$ProjectsRecord._(
              owner: owner,
              usersAssigned: _usersAssigned?.build(),
              projectName: projectName,
              description: description,
              numberTasks: numberTasks,
              completedTasks: completedTasks,
              lastEdited: lastEdited,
              timeCreated: timeCreated,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'usersAssigned';
        _usersAssigned?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProjectsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
