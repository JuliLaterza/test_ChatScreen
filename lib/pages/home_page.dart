import 'package:flutter/material.dart';
import 'package:testchatscreen/components/my_drawer.dart';

import '../services/auth/auth_service.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      drawer: MyDrawer(),
    );
  }
}