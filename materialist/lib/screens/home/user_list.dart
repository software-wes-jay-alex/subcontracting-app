import 'package:materialist/models/brew.dart';
import 'package:materialist/screens/home/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<User>>(context);

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return BrewTile(user: users[index]);
      },
    );
  }
}
