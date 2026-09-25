import 'package:flutter/material.dart';
import 'package:todo_list/model/person_model.dart';
import 'package:todo_list/services/person_services.dart';
import 'package:uuid/uuid.dart';

class PersonProvider extends ChangeNotifier {
  List<PersonModel> _personData = [];
  List<PersonModel> get personData => _personData;

  final PersonServices _services = PersonServices();

  PersonProvider() {
    fetchPerson();
  }

  Future<bool> addPerson(String name, String profession, int age) async {
    final person = PersonModel(
      id: Uuid().v4(),
      name: name,
      profession: profession,
      age: age,
    );

    await _services.addPerson(person);
    notifyListeners();
    return true;
  }

  Future<void> fetchPerson() async {
    _personData = await _services.fetchPerson();
    notifyListeners();
  }

  Future<bool> updatePerson(PersonModel person) async {
    await _services.updatePerson(person);
    fetchPerson();
    notifyListeners();
    return true;
  }

  Future<void> deletePerson(String id) async {
    await _services.deletePerson(id);
    fetchPerson();
    notifyListeners();
  }
}
