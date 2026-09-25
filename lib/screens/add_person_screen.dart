import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/provider/person_provider.dart';

class AddPersonScreen extends StatefulWidget {
  const AddPersonScreen({super.key});

  @override
  State<AddPersonScreen> createState() => _AddPersonScreenState();
}

class _AddPersonScreenState extends State<AddPersonScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final personProvider = Provider.of<PersonProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add person screen", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
      ),

      body: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(labelText: "Enter your name"),
          ),
          TextFormField(
            controller: _professionController,
            decoration: InputDecoration(labelText: "Enter your profession"),
          ),
          TextFormField(
            controller: _ageController,
            decoration: InputDecoration(labelText: "Enter your age"),
          ),
          ElevatedButton(
            onPressed: () async {
              final name = _nameController.text;
              final age = int.tryParse(_ageController.text) ?? 0;
              final profession = _professionController.text;

              if (name.isEmpty || age == 0 || profession.isEmpty) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Fill the form")));
              } else {
                final success = await personProvider.addPerson(
                  name,
                  profession,
                  age,
                );
                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Data successfully send to database"),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Failed to send to database"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }

              _nameController.clear();
              _professionController.clear();
              _ageController.clear();
            },
            child: Text("Add person"),
          ),
        ],
      ),
    );
  }
}
