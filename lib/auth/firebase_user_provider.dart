import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class MaterialistFirebaseUser {
  MaterialistFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

MaterialistFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<MaterialistFirebaseUser> materialistFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<MaterialistFirebaseUser>(
      (user) {
        currentUser = MaterialistFirebaseUser(user);
        return currentUser!;
      },
    );
