import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list/model/person_model.dart';

class PersonServices {
  final _collection = FirebaseFirestore.instance.collection('person');

  Future<void> addPerson(PersonModel person) async {
    await _collection.doc(person.id).set(person.toJson());
  }

  Future<List<PersonModel>> fetchPerson() async {
    final snapshot = await _collection.get();

    return snapshot.docs
        .map((item) => PersonModel.fromJson(item.data()))
        .toList();
  }

  Future<void> updatePerson(PersonModel person) async {
    await _collection.doc(person.id).update(person.toJson());
  }

  Future<void> deletePerson(String id) async {
    await _collection.doc(id).delete();
  }
}
