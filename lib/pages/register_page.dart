import 'package:flutter/material.dart';
import 'package:testchatscreen/components/my_button.dart';
import 'package:testchatscreen/components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();



  void signUp(){

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
                Text("Lets Create an Account for u :)", style: TextStyle(fontSize: 20)),
                const SizedBox(height: 20),
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  oscureText: false,
                ),
                const SizedBox(height: 20),
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  oscureText: true,
                ),
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  oscureText: true,
                ),
                const SizedBox(height: 30),
                MyButton(onTap: (){}, text: "Sign Up"),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const SizedBox(width: 20),
                  const Text("Already a member?"),
                  GestureDetector(
                    onTap: (){},
                    child: Text("Login Now", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                ],)
              ],
            ),
          ),
        ),
      )
    );
  }
}