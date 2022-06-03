class FirestorePath {
  FirestorePath._();

  // Todoコレクション
  static const String todosDomain = 'todos';
  // Todoに対するサブコレクションの設定
  static String todoDocPath(String documentId) => '$todosDomain/$documentId';
}
