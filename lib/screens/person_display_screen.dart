import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/person_model.dart';
import 'package:todo_list/provider/person_provider.dart';

class PersonDisplayScreen extends StatelessWidget {
  const PersonDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final personProvider = Provider.of<PersonProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Person data", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
      ),

      body: ListView.builder(
        itemCount: personProvider.personData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(personProvider.personData[index].name!),
            subtitle: Row(
              children: [
                Text(personProvider.personData[index].profession!),
                Text(personProvider.personData[index].age!.toString()),
              ],
            ),
            trailing: PopupMenuButton(
              onSelected: (value) async {
                if (value == "edit") {
                  final model = personProvider.personData[index];

                  final name = TextEditingController(text: model.name);
                  final profession = TextEditingController(
                    text: model.profession,
                  );
                  final age = TextEditingController(text: model.age.toString());

                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Edit person"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,

                          children: [
                            TextFormField(controller: name),
                            TextFormField(controller: profession),
                            TextFormField(controller: age),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () async {
                              final updatePerson = PersonModel(
                                id: model.id,
                                name: name.text,
                                profession: profession.text,
                                age: int.tryParse(age.text) ?? 0,
                              );

                              final success = await personProvider.updatePerson(
                                updatePerson,
                              );
                              if (success) {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("data updated successfully"),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("failed to update data"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            },
                            child: Text("Save"),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  await personProvider.deletePerson(
                    personProvider.personData[index].id!,
                  );
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(child: Text("Edit"), value: "edit"),
                PopupMenuItem(child: Text("Delete"), value: "delete"),
              ],
              child: Icon(Icons.more_vert),
            ),
          );
        },
      ),
    );
  }
}
