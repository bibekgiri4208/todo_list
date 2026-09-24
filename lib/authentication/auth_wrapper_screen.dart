import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/provider/authentication_provider.dart';
import 'package:todo_list/screens/signin_screen.dart';
import 'package:todo_list/screens/todo_screen.dart';

class AuthWrapperScreen extends StatelessWidget {
  const AuthWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticationProvider = Provider.of<AuthenticationProvider>(context);

    if (authenticationProvider.user != null) {
      return TodoScreen();
    } else {
      return SigninScreen();
    }
  }
}
