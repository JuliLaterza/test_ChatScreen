import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testchatscreen/models/message.dart';
//import 'package:firebase_core/firebase_core.dart';

class ChatServices {
  // get instance of Firebase
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //get user stream
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList(); // Se debe convertir el resultado a una lista
    });
  }
  // send message

  Future<void> sendMessage(String receiverID, String message) async {
    //get current user info
    final String currentUserID = _auth.currentUser!.uid;
    final String? currentUserEmail = _auth.currentUser!.email;
    final Timestamp timestamp = Timestamp.now();


    //create new message
    Message newMessage = Message(
      senderID: currentUserID, 
      senderEmail: currentUserEmail ?? '',
      receiverID: receiverID,
      message: message,
      timestamp: timestamp
    );

    //construct chat room id for the two users to ensure uniqueless
    //CREAR 
    List<String> ids = [currentUserID, receiverID];
    ids.sort();
    String chatRoomID = ids.join('_');


    await _firestore
      .collection("chat_rooms")
      .doc(chatRoomID)
      .collection("messages")
      .add(newMessage.toMap());


  }

  // get messages
  Stream<QuerySnapshot> getMessages(String userID, otherUserID) {
    List<String> ids = [userID, otherUserID]; //con esto capturamos la SALA

    ids.sort(); // para crear una llave unica, ya que solo existen mails UNICOS.
    String chatRoomID = ids.join('_'); // buscamos la sala correspondiente.

    return _firestore
      .collection("chat_rooms")
      .doc(chatRoomID)
      .collection("messages")
      .orderBy("timestamp", descending: false)
      .snapshots();
  }
  
}

