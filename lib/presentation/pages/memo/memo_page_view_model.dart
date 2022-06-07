// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 🌎 Project imports:
import 'package:mvvm_architecture_learn/model/todo_model.dart';
import 'package:mvvm_architecture_learn/service/todo_service.dart';

final memoProvider = StateNotifierProvider<MemoPageViewModel, List<TodoModel>>(
  (ref) {
    return MemoPageViewModel(
      ref.watch(todoServiceProvider),
    );
  },
);

class MemoPageViewModel extends StateNotifier<List<TodoModel>> {
  MemoPageViewModel(this.todoService) : super([]);

  final TodoService todoService;

  /// 状態管理をする変数の対象
  String title = '';
  int todoLevel = 0;
  List<String> todoList = [];
  // ignore: todo
  String uid = 'XXXXXX'; // TODO: 認証機能追加後修正
  final TextEditingController _titleTextEditingController =
      TextEditingController();
  final TextEditingController _todoItemTextEditingController =
      TextEditingController();

  void handleTitleText(e) {
    title = e;
  }

  void handleTodoLevel(e) {
    todoLevel = e;
  }

  void addTodoList(e) {
    todoList.add(e);
  }

  Future addTodoItem() async {
    await todoService.addTodoData(
      title: title,
      todoLevel: todoLevel,
      todoList: todoList,
      uid: uid,
    );
    clearForm();
  }

  void clearForm() {
    title = '';
    todoLevel = 0;
    todoList = [];
    _titleTextEditingController.clear();
    _todoItemTextEditingController.clear();
  }

  /// ------ test ------
  int count = 0;
  void addCounter() {
    count++;
  }

  void subCounter() {
    count--;
  }

  void addTodoLevel() {
    todoLevel++;
  }

  void subTodoLevel() {
    todoLevel--;
  }
}
