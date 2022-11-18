import 'package:materialist/screens/home/settings_form.dart';
import 'package:materialist/screens/wrapper.dart';
import 'package:materialist/services/auth.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({
    Key? key,
    required AuthService auth,
  })  : _auth = auth,
        super(key: key);

  final AuthService _auth;

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

    return AppBar(
      title: const Text('Users'),
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
