import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:materialist/auth/firebase_user_provider.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

class UserMock extends Mock implements User {}

void main() {
  FirebaseAuthMock firebaseAuth;
  UserMock user;

  setUp(() {
    firebaseAuth = FirebaseAuthMock();
    user = UserMock();
    currentUser = null;
  });

  test('materialistFirebaseUserStream should emit user when user is not null',
      () async {
    // Arrange
    firebaseAuth = FirebaseAuthMock();
    user = UserMock();
    when(firebaseAuth.authStateChanges())
        .thenAnswer((_) => Stream.value(user));

    // Act
    final stream = materialistFirebaseUserStream();
    final expectedUser = MaterialistFirebaseUser(user);
    final emittedUser = await stream.first;

    // Assert
    expect(emittedUser, expectedUser);
    expect(currentUser, expectedUser);
  });

  test('materialistFirebaseUserStream should not emit user when user is null',
      () async {
    // Arrange
    firebaseAuth = FirebaseAuthMock();
    user = UserMock();
    when(firebaseAuth.authStateChanges())
        .thenAnswer((_) => Stream.value(null));

    // Act
    final stream = materialistFirebaseUserStream();
    await Future.delayed(Duration(milliseconds: 1100));
    final emittedUser = await stream.firstWhere((u) => u != null, orElse: () => null);

    // Assert
    expect(emittedUser, null);
    expect(currentUser, null);
  });
}