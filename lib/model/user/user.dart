import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    @JsonKey(name: 'userId') required String userId,
    @JsonKey(name: 'userName') required String title,
    @JsonKey(name: 'age') required int userLevel,
    @JsonKey(name: 'gender') required List<String> userList,
    @JsonKey(name: 'createdAt') @CreatedAtField() DateTime? createdAt,
    @JsonKey(name: 'updatedAt') @UpdatedAtField() DateTime? updatedAt,
  }) = _User;

  const User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
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
