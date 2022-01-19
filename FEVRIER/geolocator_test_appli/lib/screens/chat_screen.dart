import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance
              .collection("chats/INkNLtt9Vkunhlks2MSd/message")
              .snapshots()
              .listen((data) {
            print(data);
          });
        },
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (ctx, index) => const Padding(
                padding: EdgeInsets.all(8),
                child: Text('This is work'),
              ),
              ),
      
    );
  }
}
