import 'package:flutter/material.dart';

import '../services/auth/auth_service.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});


  void logout() {
    //get the auth service
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: logout,
          )
        ]
      ),
      drawer: Drawer(),
    );
  }
}