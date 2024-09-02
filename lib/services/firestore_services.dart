import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  FirestoreServices._();
  static final instance = FirestoreServices._();

  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  Future<void> setData({
    required String path, // Collection/$documentId
    required Map<String, dynamic> data,
  }) async {
    final reference = firestore.doc(path);
    await reference.set(data);
  }
}
