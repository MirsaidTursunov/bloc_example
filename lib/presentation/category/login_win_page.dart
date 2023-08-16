import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginWinPage extends StatelessWidget {
   LoginWinPage({super.key});
final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('You are logged'),
        actions: [
          IconButton(onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          icon: Icon(Icons.login)),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Text('You are logged ${user?.email}  ${user?.displayName}', style: TextStyle(fontSize: 45),),
          ),
        ],
      ),
    );
  }
}
