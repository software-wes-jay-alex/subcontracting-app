import 'package:materialist/models/myuser.dart';
import 'package:materialist/screens/authenticate/authenticate.dart';
import 'package:materialist/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser?>(context);
    
    // return either the Home or Authenticate widget
    if (user == null){
      return const Authenticate();
    } else {
      return Home();
    }
    
  }
}