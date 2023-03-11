import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:materialist/auth/email_auth.dart';

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

class UserCredentialMock extends Mock implements UserCredential {}

class UserMock extends Mock implements User {}

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  FirebaseAuthMock firebaseAuth;
  UserMock user;

  setUp(() {
    firebaseAuth = FirebaseAuthMock();
    user = UserMock();
  });

  test('signInWithEmail should call FirebaseAuth.signInWithEmailAndPassword',
      () async {
    // Arrange
    FirebaseAuth firebaseAuth = FirebaseAuthMock();
    UserCredential userCredential = UserCredentialMock();
    BuildContext context = MockBuildContext();
    when(firebaseAuth.signInWithEmailAndPassword(
            email: 'test@example.com', password: 'password'))
        .thenAnswer((_) => Future.value(userCredential));

    // Act
    await signInWithEmail(context, 'test@example.com', 'password');

    // Assert
    verify(firebaseAuth.signInWithEmailAndPassword(
        email: 'test@example.com', password: 'password'));
  });

  test('createAccountWithEmail should call FirebaseAuth.createUserWithEmailAndPassword',
      () async {
    // Arrange
    FirebaseAuth firebaseAuth = FirebaseAuthMock();
    UserCredential userCredential = UserCredentialMock();
    MockBuildContext context = MockBuildContext();
    when(firebaseAuth.createUserWithEmailAndPassword(
            email: 'test@example.com', password: 'password'))
        .thenAnswer((_) => Future.value(userCredential));

    // Act
    await createAccountWithEmail(context,'test@example.com','password');

        // Assert
    verify(firebaseAuth.createUserWithEmailAndPassword(
        email: 'test@example.com', password: 'password'));
  });
}