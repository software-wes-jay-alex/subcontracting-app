import 'package:materialist/models/myuser.dart';
import 'package:materialist/services/database.dart';
import 'package:materialist/shared/constants.dart';
import 'package:materialist/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  final List<int> strengths = [100, 200, 300, 400, 500, 600, 700, 800, 900];

  // form values
  String? _currentName;
  String? _currentSugars;
  List? _currentGroups;

  @override
  Widget build(BuildContext context) {
    MyUser user = Provider.of<MyUser>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data!;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const Text(
                    'Update your Name.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val!.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  const SizedBox(height: 10.0),
                  //DropdownButtonFormField(
                  //  value: _currentSugars ?? userData.sugars,
                  //  decoration: textInputDecoration,
                  //  items: sugars.map((sugar) {
                  //    return DropdownMenuItem(
                  //      value: sugar,
                  //      child: Text('$sugar sugars'),
                  //    );
                  //  }).toList(),
                  //  onChanged: (val) => setState(() => _currentSugars = val!),
                  //),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                      child: const Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await DatabaseService(uid: user.uid).updateUserData(
                              _currentName ?? snapshot.data!.name,
                              _currentGroups ?? snapshot.data!.groups);
                          Navigator.pop(context);
                        }
                      }),
                ],
              ),
            );
          } else {
            return const Loading();
          }
        });
  }
}
