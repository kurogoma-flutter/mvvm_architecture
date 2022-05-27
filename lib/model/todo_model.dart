import 'package:cloud_firestore/cloud_firestore.dart';

class TODO {
  final String title;
  final int todoLevel;
  final List<String> todoList;
  final String uid;
  final Timestamp createdAt;

//<editor-fold desc="Data Methods">

  const TODO({
    required this.title,
    required this.todoLevel,
    required this.todoList,
    required this.uid,
    required this.createdAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TODO &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          todoLevel == other.todoLevel &&
          todoList == other.todoList &&
          uid == other.uid &&
          createdAt == other.createdAt);

  @override
  int get hashCode =>
      title.hashCode ^ todoLevel.hashCode ^ todoList.hashCode ^ uid.hashCode ^ createdAt.hashCode;

  @override
  String toString() {
    return 'TODO{' +
        ' title: $title,' +
        ' todoLevel: $todoLevel,' +
        ' todoList: $todoList,' +
        ' uid: $uid,' +
        ' createdAt: $createdAt,' +
        '}';
  }

  TODO copyWith({
    String? title,
    int? todoLevel,
    List<String>? todoList,
    String? uid,
    Timestamp? createdAt,
  }) {
    return TODO(
      title: title ?? this.title,
      todoLevel: todoLevel ?? this.todoLevel,
      todoList: todoList ?? this.todoList,
      uid: uid ?? this.uid,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'todoLevel': todoLevel,
      'todoList': todoList,
      'uid': uid,
      'createdAt': createdAt,
    };
  }

  factory TODO.fromMap(Map<String, dynamic> map) {
    return TODO(
      title: map['title'] as String,
      todoLevel: map['todoLevel'] as int,
      todoList: map['todoList'] as List<String>,
      uid: map['uid'] as String,
      createdAt: map['createdAt'] as Timestamp,
    );
  }

//</editor-fold>
}
