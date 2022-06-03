import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
abstract class Todo with _$Todo {
  const factory Todo({
    @JsonKey(name: 'todoId') required String todoId,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'todoLevel') required int todoLevel,
    @JsonKey(name: 'todoList') required List<String> todoList,
    @JsonKey(name: 'uid') required String uid,
    @JsonKey(name: 'updatedAt') @UpdatedAtField() DateTime? updatedAt,
  }) = _Todo;

  const Todo._();

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}

// プロパティにつけると変換時、そのプロパティが null なら FieldValue.serverTimestamp() に変換する
// これにより、クライアント側で作成したときのみサーバー側で時間が書き込まれるため、createdAt の挙動になる
class CreatedAtField implements JsonConverter<DateTime?, dynamic> {
  const CreatedAtField();

  @override
  DateTime? fromJson(dynamic timestamp) {
    timestamp as Timestamp?;
    return timestamp?.toDate();
  }

  // nullの時は toJson 時 FieldValue.serverTimestamp() を返すことで、createdAt の挙動になる
  @override
  dynamic toJson(DateTime? dateTime) {
    if (dateTime == null) return FieldValue.serverTimestamp();
    return dateTime;
  }
}

// プロパティにつけると変換時、必ず FieldValue.serverTimestamp() に変換される
// これにより、updatedAt の挙動になる
class UpdatedAtField implements JsonConverter<DateTime?, dynamic> {
  const UpdatedAtField();

  @override
  DateTime? fromJson(dynamic timestamp) {
    timestamp as Timestamp?;
    return timestamp?.toDate();
  }

  @override
  FieldValue toJson(DateTime? date) {
    return FieldValue.serverTimestamp();
  }
}
