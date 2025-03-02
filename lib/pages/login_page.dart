import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testchatscreen/components/my_button.dart';
import 'package:testchatscreen/components/my_text_field.dart';

import '../services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  void signin(){
    //get the auth service

    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      authService.signInWithEmailAndPassword(emailController.text, passwordController.text);
    } catch (e) {
      print(e);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(height: 50),
                Icon(Icons.message, size: 150),
                const SizedBox(height: 20),
                Text("Welcome Back", style: TextStyle(fontSize: 20)),
                const SizedBox(height: 20),
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  oscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  oscureText: true,
                ),
                const SizedBox(height: 20),
                MyButton(onTap: signin, text: "Sign In"),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const SizedBox(width: 20),
                  const Text("Dont have an account?"),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text("Sign Up!", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                ])
              ],
            ),
          ),
        ),
      )
    );
  }
}