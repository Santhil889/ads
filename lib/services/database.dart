import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
  getUserByUsername(String username) async{
    return await Firestore.instance.collection("users")
        .where("name",isEqualTo: username)
        .getDocuments();
  }
  getUserByUseremail(String useremail) async{
    return await Firestore.instance.collection("users")
        .where("email",isEqualTo: useremail)
        .getDocuments();
  }
  uploadUserData(Usermap){
    Firestore.instance.collection("users")
        .add(Usermap);
  }
  createChatRoom(String chatroomid,chatroommap){
    Firestore.instance.collection("ChatRoom")
        .document(chatroomid).setData(chatroommap).catchError((e){
          print(e.message);
    });
  }
}