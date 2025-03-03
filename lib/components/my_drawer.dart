import 'package:flutter/material.dart';

import '../pages/settings_page.dart';
import '../services/auth/auth_service.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    //get the auth service
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(Icons.message, size: 64, color: const Color.fromARGB(255, 54, 54, 54)),
                )
              ),
              
              //Padding Home
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: const Text('H O M E'),
                  leading: Icon(Icons.home, color: const Color.fromARGB(255, 54, 54, 54)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: const Text('S E T T I N G S'),
                  leading: Icon(Icons.settings, color: const Color.fromARGB(255, 54, 54, 54)),
                  onTap: () {
                    //tap fuera de drawer
                    Navigator.pop(context);
              
                    // push a la pagina de settings
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsPage(),
                      ));
                    },
                )
              ),
            ],
          ),
          
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 50),
            child: ListTile(
              title: const Text('LOG OUT'),
              leading: Icon(Icons.logout, color: const Color.fromARGB(255, 54, 54, 54)),
              onTap: logout,
            ),
          )
          
        ],
      ),

    );
  }
}