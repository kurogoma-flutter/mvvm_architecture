// 🐦 Flutter imports:
// 📦 Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cloudFirestoreServiceProvider = Provider<CloudFirestoreService>(
  (_) => CloudFirestoreService(),
);

class CloudFirestoreService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> getCollectionReference(String path) =>
      _firebaseFirestore.collection(path);

  // 指定したコレクションにデータを追加
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = _firebaseFirestore.collection(path);
    await reference.add(data);
  }

  // 複数データを持つドキュメント用?
  Future<void> arrayRemove({
    required String path,
    required String field,
    required dynamic elementToBeRemoved,
  }) async {
    final reference = _firebaseFirestore.doc(path);
    await reference.update(
      {
        field: FieldValue.arrayRemove([elementToBeRemoved])
      },
    );
    debugPrint('arrayRemove: $path of $field field');
  }

  // ドキュメントのフィールドを削除
  Future<void> deleteField({required String path, required String field}) async {
    final reference = _firebaseFirestore.doc(path);
    debugPrint('delete: $path');
    await reference.update({field: FieldValue.delete()});
  }

  // ドキュメントに追加
  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
    bool merge = true,
  }) async {
    final reference = _firebaseFirestore.doc(path);
    await reference.set(data, SetOptions(merge: merge));
  }

  // ドキュメントを更新
  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    await reference.update(data);
  }

  // ドキュメントを削除
  Future<void> deleteData({required String path}) async {
    final reference = _firebaseFirestore.doc(path);
    await reference.delete();
  }

  // コレクション取得：常時監視
  Stream<List<T>> collectionStream<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String documentID) builder,
    Query<Map<String, dynamic>> Function(Query<Map<String, dynamic>> query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    Query<Map<String, dynamic>> query = _firebaseFirestore.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map((snapshot) => builder(snapshot.data(), snapshot.id))
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  // コレクション取得：１度きり
  Future<List<T>> collectionFuture<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String documentID) builder,
    Query<Map<String, dynamic>> Function(Query<Map<String, dynamic>> query)? queryBuilder,
  }) async {
    Query<Map<String, dynamic>> query = _firebaseFirestore.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final querySnapshot = await query.get();
    return querySnapshot.docs
        .map((snapshot) => builder(snapshot.data(), snapshot.id))
        .where((value) => value != null)
        .toList();
  }

  // ドキュメント単位で取得：常時取得
  Stream<T> documentStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentID) builder,
  }) {
    final reference = _firebaseFirestore.doc(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => builder(snapshot.data(), snapshot.id));
  }

  // ドキュメント単位で取得：１回切り用
  Future<DocumentSnapshot<Map<String, dynamic>>> fetchDocumentSnapshot({
    required String path,
  }) {
    final reference = _firebaseFirestore.doc(path);
    return reference.get();
  }

  // ドキュメントが存在するかチェックする
  Future<bool> hasDocumentSnapshotExisted({
    required String path,
  }) async {
    final reference = await _firebaseFirestore.doc(path).get();
    return reference.exists;
  }
}
