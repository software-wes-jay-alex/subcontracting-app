import 'package:materialist/models/brew.dart';
import 'package:materialist/screens/home/user_list.dart';
import 'package:materialist/screens/home/settings_form.dart';
import 'package:materialist/screens/my_drawer.dart';
import 'package:materialist/screens/wrapper.dart';
import 'package:materialist/services/auth.dart';
import 'package:materialist/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  Home({super.key});
  static const id = "home";
  @override
  Widget build(BuildContext context) {
    void showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: const SettingsForm(),
            );
          });
    }

    return StreamProvider<List<User>>.value(
      value: DatabaseService(uid: '').brews,
      initialData: const [],
      child: Scaffold(
        //backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: const Text('Users'),
          //backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              icon: const Icon(Icons.person),
              label: const Text('logout'),
              onPressed: () async {
                await _auth.signOut();
                const Wrapper();
              },
            ),
            TextButton.icon(
              icon: const Icon(Icons.settings),
              label: const Text('settings'),
              onPressed: () => showSettingsPanel(),
            )
          ],
        ),
        drawer: const MyDrawer(),
        body: const UserList(),
      ),
    );
  }
}
