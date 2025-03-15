import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testchatscreen/components/my_text_field.dart';
import 'package:testchatscreen/services/auth/auth_service.dart';
import 'package:testchatscreen/services/chat/chat_services.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;

  ChatPage({
    super.key, 
    required this.receiverEmail,
    required this.receiverID
    });
  
  // text controller
  final TextEditingController _messageController = TextEditingController();

  final ChatServices _chatService = ChatServices();
  final AuthService _authService = AuthService();

  // send message

  void sendMessage() async {
    if(_messageController.text.isNotEmpty){
      await _chatService.sendMessage(receiverID, _messageController.text);
    }

    //clear text controller
    _messageController.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail),
      ),
      body: Column(
        children: [
          //display all messages.
          Expanded(child: _buildMessageList()),
          _buildUserInput(),
        ],
      ),
    );
  }


  Widget _buildMessageList(){
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(receiverID, senderID), 
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error");
        }
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }

        return ListView(
          children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      });
  }

  // build message item

  Widget _buildMessageItem(DocumentSnapshot doc){
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Text(data['message']);
  }

  // build message input

  Widget _buildUserInput() {
    return Row(
      children: [
        //textfiled should take up most of the space
        Expanded(
          child: MyTextField(
            controller: _messageController, 
            hintText: "Type a message", 
            oscureText: false)
          ),
          IconButton(onPressed: sendMessage, icon: Icon(Icons.arrow_upward))
      ],
    );
  }

}