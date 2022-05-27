// 📦 Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 🌎 Project imports:
import '../firebase/firestore_path.dart';
import '../firebase/firestore_service.dart';

final contentRemoteDataSourceProvider = Provider<ContentRemoteDataSource>(
  (ref) => ContentRemoteDataSource._(
    ref.watch(cloudFirestoreServiceProvider),
  ),
);

class ContentRemoteDataSource {
  ContentRemoteDataSource._(
    this._cloudFirestoreService,
  );
  final CloudFirestoreService _cloudFirestoreService;

  Future<void> addContentData(Map<String, dynamic> data) async {
    final todoId = data['todoId'];
    final path = FirestorePath.todoDocPath(todoId);
    await _cloudFirestoreService.setData(path: path, data: data);
  }

  Future<void> setContentData(Map<String, dynamic> data) async {
    final todoId = data['todoId'];
    final path = FirestorePath.todoDocPath(todoId);
    await _cloudFirestoreService.setData(path: path, data: data, merge: true);
  }

  Future<void> deleteContent(Map<String, dynamic> data) async {
    final todoId = data['todoId'];
    final path = FirestorePath.todoDocPath(todoId);
    await _cloudFirestoreService.deleteData(path: path);
  }

  Query<Map<String, dynamic>> todosQuery(String spaceId) => _cloudFirestoreService
      .getCollectionReference(FirestorePath.todosDomain)
      .orderBy('createdAt', descending: true);
}
