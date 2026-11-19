import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_sanctuaryv2/features/discover/data/models/animal.dart';

class AnimalDataService {
  AnimalDataService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

    final FirebaseFirestore _firestore;

    Future<List<Animal>> fetchAnimals() async {
      final snapshot = await _firestore.collection('animals').get();
      return snapshot.docs.map((doc) => Animal.fromMap(doc.id, doc.data())).toList();
    }
}
