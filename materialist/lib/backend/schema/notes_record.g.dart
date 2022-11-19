// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NotesRecord> _$notesRecordSerializer = new _$NotesRecordSerializer();

class _$NotesRecordSerializer implements StructuredSerializer<NotesRecord> {
  @override
  final Iterable<Type> types = const [NotesRecord, _$NotesRecord];
  @override
  final String wireName = 'NotesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotesRecord object,
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
    value = object.taskRef;
    if (value != null) {
      result
        ..add('taskRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.note;
    if (value != null) {
      result
        ..add('note')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.timePosted;
    if (value != null) {
      result
        ..add('timePosted')
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
  NotesRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotesRecordBuilder();

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
        case 'taskRef':
          result.taskRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'note':
          result.note = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'timePosted':
          result.timePosted = serializers.deserialize(value,
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

class _$NotesRecord extends NotesRecord {
  @override
  final DocumentReference<Object?>? owner;
  @override
  final DocumentReference<Object?>? taskRef;
  @override
  final String? note;
  @override
  final DateTime? timePosted;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$NotesRecord([void Function(NotesRecordBuilder)? updates]) =>
      (new NotesRecordBuilder()..update(updates))._build();

  _$NotesRecord._(
      {this.owner, this.taskRef, this.note, this.timePosted, this.ffRef})
      : super._();

  @override
  NotesRecord rebuild(void Function(NotesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotesRecordBuilder toBuilder() => new NotesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotesRecord &&
        owner == other.owner &&
        taskRef == other.taskRef &&
        note == other.note &&
        timePosted == other.timePosted &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, owner.hashCode), taskRef.hashCode), note.hashCode),
            timePosted.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotesRecord')
          ..add('owner', owner)
          ..add('taskRef', taskRef)
          ..add('note', note)
          ..add('timePosted', timePosted)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class NotesRecordBuilder implements Builder<NotesRecord, NotesRecordBuilder> {
  _$NotesRecord? _$v;

  DocumentReference<Object?>? _owner;
  DocumentReference<Object?>? get owner => _$this._owner;
  set owner(DocumentReference<Object?>? owner) => _$this._owner = owner;

  DocumentReference<Object?>? _taskRef;
  DocumentReference<Object?>? get taskRef => _$this._taskRef;
  set taskRef(DocumentReference<Object?>? taskRef) => _$this._taskRef = taskRef;

  String? _note;
  String? get note => _$this._note;
  set note(String? note) => _$this._note = note;

  DateTime? _timePosted;
  DateTime? get timePosted => _$this._timePosted;
  set timePosted(DateTime? timePosted) => _$this._timePosted = timePosted;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  NotesRecordBuilder() {
    NotesRecord._initializeBuilder(this);
  }

  NotesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _owner = $v.owner;
      _taskRef = $v.taskRef;
      _note = $v.note;
      _timePosted = $v.timePosted;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotesRecord;
  }

  @override
  void update(void Function(NotesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotesRecord build() => _build();

  _$NotesRecord _build() {
    final _$result = _$v ??
        new _$NotesRecord._(
            owner: owner,
            taskRef: taskRef,
            note: note,
            timePosted: timePosted,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
