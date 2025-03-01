import 'package:flutter/material.dart';
import 'package:testchatscreen/pages/login_page.dart';
import 'package:testchatscreen/pages/register_page.dart';


class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  bool showLoginPage = true;
  

  void toggle(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(onTap: toggle);
    }else{
      return RegisterPage(onTap: toggle);
    }
  }
}