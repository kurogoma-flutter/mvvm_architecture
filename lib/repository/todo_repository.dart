// 📦 Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 🌎 Project imports:
import '../model/todo_model.dart';
import '../remote_data_source/todo_remote_data_source.dart';

final todoRepositoryProvider = Provider(
    (ref) => TodoRepository._(ref.watch(todoRemoteDataSourceProvider)));

class TodoRepository {
  TodoRepository._(this._todoRemoteDataSource);

  final TodoRemoteDataSource _todoRemoteDataSource;

  Future<List<TodoModel>> fetchTodoList(String s) async =>
      await _todoRemoteDataSource.fetchTodoList('XXX');

  Future<void> addTodoData(TodoModel todoModel) async {
    await _todoRemoteDataSource.addTodoData(todoModel.toMap());
  }

  Future<void> setTodoData(TodoModel todoModel) async {
    await _todoRemoteDataSource.setTodoData(todoModel.toMap());
  }

  Future<void> deleteTodo(TodoModel todoModel) async {
    await _todoRemoteDataSource.deleteTodo(todoModel.toMap());
  }

  Query<TodoModel> todosQuery(String todoId) =>
      _todoRemoteDataSource.todosQuery(todoId).withConverter(
            fromFirestore: (snapshot, _) => TodoModel.fromMap(snapshot.data()!),
            toFirestore: (messageV1Model, _) => messageV1Model.toMap(),
          );
}
