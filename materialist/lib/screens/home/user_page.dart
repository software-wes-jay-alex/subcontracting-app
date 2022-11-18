import 'package:materialist/models/brew.dart';
import 'package:materialist/screens/home/user_list.dart';
import 'package:materialist/screens/drawer.dart';
import 'package:materialist/services/auth.dart';
import 'package:materialist/services/database.dart';
import 'package:flutter/material.dart';
import 'package:materialist/widgets/app_bar.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const id = "home";
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<User>>.value(
      value: DatabaseService(uid: null).brews,
      initialData: const [],
      child: Scaffold(
        appBar: MyAppBar(
          auth: AuthService(),
        ),
        drawer: const MyDrawer(),
        body: const UserList(),
      ),
    );
  }
}
