import 'package:flutter/material.dart';
import 'package:testchatscreen/components/my_button.dart';
import 'package:testchatscreen/components/my_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  void login(){

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
                  controller: TextEditingController(),
                  hintText: "Email",
                  oscureText: false,
                ),
                const SizedBox(height: 30),
                MyTextField(
                  controller: TextEditingController(),
                  hintText: "Password",
                  oscureText: true,
                ),
                const SizedBox(height: 30),
                MyButton(onTap: login, text: "Sign In"),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const SizedBox(width: 20),
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: (){},
                    child: const Text("Sign Up", style: TextStyle(fontWeight: FontWeight.bold)),
                  )
                ],)
              ],
            ),
          ),
        ),
      )
    );
  }
}