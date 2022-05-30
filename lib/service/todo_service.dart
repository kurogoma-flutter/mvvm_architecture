// 📦 Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_architecture_learn/repository/todo_repository.dart';
import 'package:uuid/uuid.dart';

import '../model/todo_model.dart';

final todoServiceProvider = Provider<TodoService>(
    (ref) => TodoService(ref.watch(todoRepositoryProvider)));

class TodoService {
  TodoService(
    this.todoRepository,
  );

  final TodoRepository todoRepository;
  final Uuid uuid = const Uuid();

  // モデルから枠組み生成
  TodoModel todoData = TodoModel.initialData();

  // Todo一覧を取得
  Future<List<TodoModel>> fetchTodoList() async =>
      todoRepository.fetchTodoList('XXX');

  // モデルの枠組みにデータを入れるイメージ
  // ここをステート管理していく
  Future<void> addTodoData({
    required TodoModel todoModel,
  }) async {
    todoModel.todoId = uuid.v4();
    todoModel.title = '';
    todoModel.todoLevel = 2;
    todoModel.todoList = ['ご飯食べる', 'ランニングする'];
    todoModel.uid = 'XXX';
    await todoRepository.addTodoData(todoModel);
  }

  Query<TodoModel> todosQuery(String todoId) =>
      todoRepository.todosQuery(todoId);
}
