import 'package:flutter/material.dart';
import 'package:testchatscreen/components/my_drawer.dart';
import 'package:testchatscreen/components/user_tile.dart';
import 'package:testchatscreen/pages/chat_page.dart';
import 'package:testchatscreen/services/auth/auth_service.dart';
import '../services/chat/chat_services.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  // chat and auth services

  final ChatServices _chatServices = ChatServices();
  final AuthService _authService = AuthService();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList(){
    return StreamBuilder(
      stream: _chatServices.getUserStream(), 
      builder: (context, snapshot){
          if (snapshot.hasError) {
            return const Text("Error");
          }

          //loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          }

          return ListView(
            children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData,context)).toList(),
          );
      });
  }

  // Build individual list tile for user

  Widget _buildUserListItem(
    Map<String, dynamic> userData, BuildContext context) {

    //display all users except current user.
    
    if (userData['email'] != _authService.getCurrentUser()!.email) {
      return UserTile(
      text: userData['email'],
      onTap: () {
        // go to chat page for each user.

        Navigator.push(context,
        MaterialPageRoute(builder: (context) => ChatPage(
          receiverEmail: userData['email'])
          )
          );
      });
    } 
    else {
      return Container();
    }


  }


}