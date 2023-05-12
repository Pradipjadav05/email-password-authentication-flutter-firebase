import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = "";
  String email = "";
  String uid = "";

  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> inputData() async {
    final User? user = auth.currentUser;
    uid = user!.uid;
    name = user.displayName!;
    email = user.email!;

    debugPrint("name : $name");
    debugPrint("email : $email");
  }

  @override
  void initState() {
    super.initState();

    inputData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
        title: const Text('Email Password Authentication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Logged In $email'),
            Text('Name : $name'),
            Text('Id : $uid'),
          ],
        ),
      ),
    );
  }
}
