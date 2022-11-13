import 'package:materialist/models/brew.dart';
import 'package:flutter/material.dart';

class BrewTile extends StatelessWidget {
  final User user;
  const BrewTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[user.groups.length],
            backgroundImage: const AssetImage('coffee_icon.png'),
          ),
          title: Text(user.name),
          subtitle: Text('Member of  ${user.groups.length} group(s)'),
          onTap: () {
            user.groups.forEach((group) {
              print(group);
            });
          },
          trailing: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              if (user.groups.length < 3) {
                user.groups.add('new group');
              }
            },
          ),
        ),
      ),
    );
  }
}
