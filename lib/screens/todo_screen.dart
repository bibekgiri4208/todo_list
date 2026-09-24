import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/provider/authentication_provider.dart';
import 'package:todo_list/provider/theme_provider.dart';
import 'package:todo_list/provider/todo_provider.dart';
import 'package:todo_list/screens/signin_screen.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authenticationProvider = Provider.of<AuthenticationProvider>(context);
    final todoprovider = Provider.of<TodoProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To Do List",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF5F33E1),
        foregroundColor: Colors.white,
        actions: [
          Switch(
            value: themeProvider.isDarkTheme,
            onChanged: (_) {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _todoController,
                    decoration: InputDecoration(
                      hintText: "Enter a task...",
                      prefixIcon: Icon(
                        Icons.task_alt,
                        color: Color(0xFF5F33E1),
                      ),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Color(0xFF5F33E1),
                          width: 2,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    if (_todoController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please add Input"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      todoprovider.addTodo(_todoController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Added"),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                    _todoController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5F33E1),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                  ),
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            ListView.builder(
              shrinkWrap: true,
              itemCount: todoprovider.todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todoprovider.todos[index].title),
                  trailing: IconButton(
                    onPressed: () {
                      todoprovider.removeTodo(index);
                    },
                    icon: Icon(Icons.delete, color: Colors.red),
                  ),
                );
              },
            ),

            ElevatedButton(
              onPressed: () {
                authenticationProvider.signOut();
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
