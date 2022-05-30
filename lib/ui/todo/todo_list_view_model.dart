// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 🌎 Project imports:
import 'package:mvvm_architecture_learn/model/todo_model.dart';
import 'package:mvvm_architecture_learn/service/todo_service.dart';

final todoPageViewModelProvider = ChangeNotifierProvider<todoPageViewModel>(
  (ref) {
    return todoPageViewModel(
      ref.watch(todoServiceProvider),
    );
  },
);

class todoPageViewModel extends ChangeNotifier {
  todoPageViewModel(
    this.todoService,
  );

  final TodoService todoService;

  /// 状態管理をする変数の対象
  String title = '';
  int todoLevel = 0;
  List<String> todoList = [];
  // ignore: todo
  String uid = 'XXXXXX'; // TODO: 認証機能追加後修正

  void handleTitleText(e) {
    title = e;
    notifyListeners();
  }

  void handleTodoLevel(e) {
    todoLevel = e;
    notifyListeners();
  }

  void addTodoList(e) {
    todoList.add(e);
    notifyListeners();
  }

  Future addTodoItem() async {
    await todoService.addTodoData(
      title: title,
      todoLevel: todoLevel,
      todoList: todoList,
      uid: uid,
    );
  }

  void clearForm(TextEditingController controller) {
    title = '';
    todoLevel = 0;
    todoList = [];
    controller.clear();
    notifyListeners();
  }
}
