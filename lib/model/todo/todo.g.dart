// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Todo _$$_TodoFromJson(Map<String, dynamic> json) => _$_Todo(
      todoId: json['todoId'] as String,
      title: json['title'] as String,
      todoLevel: json['todoLevel'] as int,
      todoList:
          (json['todoList'] as List<dynamic>).map((e) => e as String).toList(),
      uid: json['uid'] as String,
      updatedAt: const UpdatedAtField().fromJson(json['updatedAt']),
    );

Map<String, dynamic> _$$_TodoToJson(_$_Todo instance) => <String, dynamic>{
      'todoId': instance.todoId,
      'title': instance.title,
      'todoLevel': instance.todoLevel,
      'todoList': instance.todoList,
      'uid': instance.uid,
      'updatedAt': const UpdatedAtField().toJson(instance.updatedAt),
    };
