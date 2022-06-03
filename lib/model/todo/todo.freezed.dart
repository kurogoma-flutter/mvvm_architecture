// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Todo _$TodoFromJson(Map<String, dynamic> json) {
  return _Todo.fromJson(json);
}

/// @nodoc
mixin _$Todo {
  @JsonKey(name: 'todoId')
  String get todoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'todoLevel')
  int get todoLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'todoList')
  List<String> get todoList => throw _privateConstructorUsedError;
  @JsonKey(name: 'uid')
  String get uid => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  @UpdatedAtField()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoCopyWith<Todo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoCopyWith<$Res> {
  factory $TodoCopyWith(Todo value, $Res Function(Todo) then) =
      _$TodoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'todoId') String todoId,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'todoLevel') int todoLevel,
      @JsonKey(name: 'todoList') List<String> todoList,
      @JsonKey(name: 'uid') String uid,
      @JsonKey(name: 'updatedAt') @UpdatedAtField() DateTime? updatedAt});
}

/// @nodoc
class _$TodoCopyWithImpl<$Res> implements $TodoCopyWith<$Res> {
  _$TodoCopyWithImpl(this._value, this._then);

  final Todo _value;
  // ignore: unused_field
  final $Res Function(Todo) _then;

  @override
  $Res call({
    Object? todoId = freezed,
    Object? title = freezed,
    Object? todoLevel = freezed,
    Object? todoList = freezed,
    Object? uid = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      todoId: todoId == freezed
          ? _value.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      todoLevel: todoLevel == freezed
          ? _value.todoLevel
          : todoLevel // ignore: cast_nullable_to_non_nullable
              as int,
      todoList: todoList == freezed
          ? _value.todoList
          : todoList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_TodoCopyWith<$Res> implements $TodoCopyWith<$Res> {
  factory _$$_TodoCopyWith(_$_Todo value, $Res Function(_$_Todo) then) =
      __$$_TodoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'todoId') String todoId,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'todoLevel') int todoLevel,
      @JsonKey(name: 'todoList') List<String> todoList,
      @JsonKey(name: 'uid') String uid,
      @JsonKey(name: 'updatedAt') @UpdatedAtField() DateTime? updatedAt});
}

/// @nodoc
class __$$_TodoCopyWithImpl<$Res> extends _$TodoCopyWithImpl<$Res>
    implements _$$_TodoCopyWith<$Res> {
  __$$_TodoCopyWithImpl(_$_Todo _value, $Res Function(_$_Todo) _then)
      : super(_value, (v) => _then(v as _$_Todo));

  @override
  _$_Todo get _value => super._value as _$_Todo;

  @override
  $Res call({
    Object? todoId = freezed,
    Object? title = freezed,
    Object? todoLevel = freezed,
    Object? todoList = freezed,
    Object? uid = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_Todo(
      todoId: todoId == freezed
          ? _value.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      todoLevel: todoLevel == freezed
          ? _value.todoLevel
          : todoLevel // ignore: cast_nullable_to_non_nullable
              as int,
      todoList: todoList == freezed
          ? _value._todoList
          : todoList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Todo extends _Todo with DiagnosticableTreeMixin {
  const _$_Todo(
      {@JsonKey(name: 'todoId') required this.todoId,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'todoLevel') required this.todoLevel,
      @JsonKey(name: 'todoList') required final List<String> todoList,
      @JsonKey(name: 'uid') required this.uid,
      @JsonKey(name: 'updatedAt') @UpdatedAtField() this.updatedAt})
      : _todoList = todoList,
        super._();

  factory _$_Todo.fromJson(Map<String, dynamic> json) => _$$_TodoFromJson(json);

  @override
  @JsonKey(name: 'todoId')
  final String todoId;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'todoLevel')
  final int todoLevel;
  final List<String> _todoList;
  @override
  @JsonKey(name: 'todoList')
  List<String> get todoList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todoList);
  }

  @override
  @JsonKey(name: 'uid')
  final String uid;
  @override
  @JsonKey(name: 'updatedAt')
  @UpdatedAtField()
  final DateTime? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Todo(todoId: $todoId, title: $title, todoLevel: $todoLevel, todoList: $todoList, uid: $uid, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Todo'))
      ..add(DiagnosticsProperty('todoId', todoId))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('todoLevel', todoLevel))
      ..add(DiagnosticsProperty('todoList', todoList))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Todo &&
            const DeepCollectionEquality().equals(other.todoId, todoId) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.todoLevel, todoLevel) &&
            const DeepCollectionEquality().equals(other._todoList, _todoList) &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(todoId),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(todoLevel),
      const DeepCollectionEquality().hash(_todoList),
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$$_TodoCopyWith<_$_Todo> get copyWith =>
      __$$_TodoCopyWithImpl<_$_Todo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoToJson(this);
  }
}

abstract class _Todo extends Todo {
  const factory _Todo(
      {@JsonKey(name: 'todoId')
          required final String todoId,
      @JsonKey(name: 'title')
          required final String title,
      @JsonKey(name: 'todoLevel')
          required final int todoLevel,
      @JsonKey(name: 'todoList')
          required final List<String> todoList,
      @JsonKey(name: 'uid')
          required final String uid,
      @JsonKey(name: 'updatedAt')
      @UpdatedAtField()
          final DateTime? updatedAt}) = _$_Todo;
  const _Todo._() : super._();

  factory _Todo.fromJson(Map<String, dynamic> json) = _$_Todo.fromJson;

  @override
  @JsonKey(name: 'todoId')
  String get todoId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'todoLevel')
  int get todoLevel => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'todoList')
  List<String> get todoList => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'uid')
  String get uid => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'updatedAt')
  @UpdatedAtField()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TodoCopyWith<_$_Todo> get copyWith => throw _privateConstructorUsedError;
}
