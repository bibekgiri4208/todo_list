import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/provider/image_picker_provider.dart';
import 'package:todo_list/provider/theme_provider.dart';
import 'package:todo_list/provider/todo_provider.dart';
import 'package:todo_list/screens/image_picker_screen.dart';
import 'package:todo_list/screens/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => TodoProvider()),
        ChangeNotifierProvider(create: (_) => ImagePickerProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            title: 'My App',
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.blue,
            ),

            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.indigo,
            ),
            themeMode: themeProvider.themeMode,
            home: ImagePickerScreen(),
          );
        },
      ),
    );
  }
}
