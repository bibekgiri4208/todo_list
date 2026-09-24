import 'package:flutter/material.dart';
import 'package:todo_list/model/person_model.dart';
import 'package:todo_list/services/person_services.dart';
import 'package:uuid/uuid.dart';

class PersonProvider extends ChangeNotifier {
  List<PersonProvider> _personData = [];
  List<PersonProvider> get personData => _personData;

  final PersonServices _services = PersonServices();

  Future<void> addPerson(String name, String profession, int age) async {
    final person = PersonModel(
      id: Uuid().v4(),
      name: name,
      profession: profession,
      age: age,
    );

    await _services.addPerson(person);
    notifyListeners();
  }
}
