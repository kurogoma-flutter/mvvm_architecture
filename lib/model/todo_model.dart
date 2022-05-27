import 'package:cloud_firestore/cloud_firestore.dart';

class TODO {
  final String todoId; // documentIdと一致
  final String title; // todoタイトル
  final int todoLevel; // todoの緊急度
  final List<String> todoList; // todo一覧
  final String uid; // UID
  final Timestamp updatedAt; // 登録日時

//<editor-fold desc="Data Methods">

  const TODO({
    required this.todoId,
    required this.title,
    required this.todoLevel,
    required this.todoList,
    required this.uid,
    required this.updatedAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TODO &&
          runtimeType == other.runtimeType &&
          todoId == other.todoId &&
          title == other.title &&
          todoLevel == other.todoLevel &&
          todoList == other.todoList &&
          uid == other.uid &&
          updatedAt == other.updatedAt);

  @override
  int get hashCode =>
      title.hashCode ^
      todoId.hashCode ^
      todoLevel.hashCode ^
      todoList.hashCode ^
      uid.hashCode ^
      updatedAt.hashCode;

  @override
  String toString() {
    return 'TODO{' +
        ' todoId: $todoId,' +
        ' title: $title,' +
        ' todoLevel: $todoLevel,' +
        ' todoList: $todoList,' +
        ' uid: $uid,' +
        ' updatedAt: $updatedAt,' +
        '}';
  }

  TODO copyWith({
    String? todoId,
    String? title,
    int? todoLevel,
    List<String>? todoList,
    String? uid,
    Timestamp? updatedAt,
  }) {
    return TODO(
      todoId: todoId ?? this.todoId,
      title: title ?? this.title,
      todoLevel: todoLevel ?? this.todoLevel,
      todoList: todoList ?? this.todoList,
      uid: uid ?? this.uid,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'todoId': todoId,
      'title': title,
      'todoLevel': todoLevel,
      'todoList': todoList,
      'uid': uid,
      'updatedAt': updatedAt,
    };
  }

  factory TODO.fromMap(Map<String, dynamic> map) {
    return TODO(
      todoId: map['todoId'] as String,
      title: map['title'] as String,
      todoLevel: map['todoLevel'] as int,
      todoList: map['todoList'] as List<String>,
      uid: map['uid'] as String,
      updatedAt: map['updatedAt'] as Timestamp,
    );
  }

//</editor-fold>
}
