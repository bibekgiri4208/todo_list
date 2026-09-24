import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/authentication/auth_wrapper_screen.dart';
import 'package:todo_list/firebase_options.dart';
import 'package:todo_list/provider/authentication_provider.dart';
import 'package:todo_list/provider/image_picker_provider.dart';
import 'package:todo_list/provider/theme_provider.dart';
import 'package:todo_list/provider/todo_provider.dart';
import 'package:todo_list/screens/image_picker_screen.dart';
import 'package:todo_list/screens/signin_screen.dart';
import 'package:todo_list/screens/signup_screen.dart';
import 'package:todo_list/screens/todo_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
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
            home: AuthWrapperScreen(),
          );
        },
      ),
    );
  }
}
