import 'package:cloud_firestore/cloud_firestore.dart';

class FlavorService {
  final CollectionReference flavorsRef =
      FirebaseFirestore.instance.collection('flavors');

  Future<List<DocumentSnapshot>> getFlavors() async {
    QuerySnapshot snapshot = await flavorsRef.get();
    return snapshot.docs;
  }

  Future<DocumentSnapshot> getFlavor(String id) async {
    DocumentSnapshot doc = await flavorsRef.doc(id).get();
    return doc;
  }

  Future<void> addFlavor(Map<String, dynamic> flavor) async {
    await flavorsRef.add(flavor);
  }

  Future<void> updateFlavor(String id, Map<String, dynamic> data) async {
    await flavorsRef.doc(id).update(data);
  }

  Future<void> deleteFlavor(String id) async {
    await flavorsRef.doc(id).delete();
  }
}