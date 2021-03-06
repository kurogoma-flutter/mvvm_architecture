// ð¦ Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
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

  // ã¢ãã«ããæ çµã¿çæ
  TodoModel todoData = TodoModel.initialData();

  // Todoä¸è¦§ãåå¾
  Future<List<TodoModel>> fetchTodoList() async =>
      todoRepository.fetchTodoList('XXX');

  // ã¢ãã«ã®æ çµã¿ã«ãã¼ã¿ãå¥ããã¤ã¡ã¼ã¸
  // ãããã¹ãã¼ãç®¡çãã¦ãã
  Future<void> addTodoData({
    required String title,
    required int todoLevel,
    required List<String> todoList,
    required String uid,
  }) async {
    todoData.todoId = uuid.v4();
    todoData.title = title;
    todoData.todoLevel = todoLevel;
    todoData.todoList = todoList;
    todoData.uid = uid;
    await todoRepository.addTodoData(todoData);
  }

  Query<TodoModel> todosQuery(String todoId) =>
      todoRepository.todosQuery(todoId);
}
