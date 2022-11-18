import 'package:flutter/foundation.dart';
import 'package:materialist/models/brew.dart';
import 'package:materialist/models/myuser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({required this.uid});

  // collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> updateUserData(String name, List groups) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'groups': groups,
    });
  }

  // brew list from snapshot
  List<User> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      if (kDebugMode) {
        print(doc.data);
      }
      return User(name: doc.get('name') ?? '', groups: doc.get('groups') ?? []);
    }).toList();
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    if (kDebugMode) {
      print(snapshot.get('uid'));
      print(snapshot.get('name'));
      print(snapshot.get('groups'));
    }
    return UserData(
      uid: uid!,
      name: snapshot.get('name'),
      groups: snapshot.get('groups'),
    );
  }

  // get brews stream
  Stream<List<User>> get brews {
    return userCollection.snapshots().map(_brewListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return userCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
