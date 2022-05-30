import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String todoId; // documentIdと一致
  String title; // todoタイトル
  int todoLevel; // todoの緊急度
  List<String> todoList; // todo一覧
  String uid; // UID
  Timestamp updatedAt; // 登録日時

//<editor-fold desc="Data Methods">

  TodoModel({
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
      (other is TodoModel &&
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
    return 'TodoModel{' +
        ' todoId: $todoId,' +
        ' title: $title,' +
        ' todoLevel: $todoLevel,' +
        ' todoList: $todoList,' +
        ' uid: $uid,' +
        ' updatedAt: $updatedAt,' +
        '}';
  }

  TodoModel copyWith({
    String? todoId,
    String? title,
    int? todoLevel,
    List<String>? todoList,
    String? uid,
    Timestamp? updatedAt,
  }) {
    return TodoModel(
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

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      todoId: map['todoId'] as String,
      title: map['title'] as String,
      todoLevel: map['todoLevel'] as int,
      todoList: map['todoList'] as List<String>,
      uid: map['uid'] as String,
      updatedAt: map['updatedAt'] as Timestamp,
    );
  }

  factory TodoModel.initialData() => TodoModel(
        todoId: '',
        title: '',
        todoLevel: 1,
        todoList: [],
        uid: '',
        updatedAt: Timestamp.now(),
      );

//</editor-fold>
}
