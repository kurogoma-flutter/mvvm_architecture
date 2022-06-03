// 📦 Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_architecture_learn/model/todo_model.dart';

// 🌎 Project imports:
import '../firebase/cloud_firestore/firestore_path.dart';
import '../firebase/cloud_firestore/firestore_service.dart';

final todoRemoteDataSourceProvider = Provider<TodoRemoteDataSource>(
  (ref) => TodoRemoteDataSource._(
    ref.watch(cloudFirestoreServiceProvider),
  ),
);

class TodoRemoteDataSource {
  TodoRemoteDataSource._(
    this._cloudFirestoreService,
  );
  final CloudFirestoreService _cloudFirestoreService;

  Future<List<TodoModel>> fetchTodoList(String uid) async =>
      _cloudFirestoreService.collectionFuture(
        path: FirestorePath.todosDomain,
        queryBuilder: (query) => query.where('uid', isEqualTo: uid),
        builder: (data, _) => TodoModel.fromMap(data),
      );

  Future<void> addTodoData(Map<String, dynamic> data) async {
    final todoId = data['todoId'];
    final path = FirestorePath.todoDocPath(todoId);
    await _cloudFirestoreService.setData(path: path, data: data);
  }

  Future<void> setTodoData(Map<String, dynamic> data) async {
    final todoId = data['todoId'];
    final path = FirestorePath.todoDocPath(todoId);
    await _cloudFirestoreService.setData(path: path, data: data, merge: true);
  }

  Future<void> deleteTodo(Map<String, dynamic> data) async {
    final todoId = data['todoId'];
    final path = FirestorePath.todoDocPath(todoId);
    await _cloudFirestoreService.deleteData(path: path);
  }

  Query<Map<String, dynamic>> todosQuery(String spaceId) =>
      _cloudFirestoreService
          .getCollectionReference(FirestorePath.todosDomain)
          .orderBy('createdAt', descending: true);
}
