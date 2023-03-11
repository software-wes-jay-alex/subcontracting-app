import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mockito/mockito.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:materialist/auth/auth_util.dart';

import 'anonymous_auth_test.dart';

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

class UserCredentialMock extends Mock implements UserCredential {}

class UserMock extends Mock implements User {}

void main() {
  FirebaseAuth firebaseAuth;
  UserCredential userCredential;
  User user;
  firebaseAuth = FirebaseAuthMock();
  userCredential = UserCredentialMock();
  user = UserMock();

  when(userCredential.user).thenReturn(user);
  //when(firebaseAuth.signOut()).thenAnswer((_) => ); //Future.value());
  //when(user.delete()).thenAnswer((_) => Future.value());
  //when(firebaseAuth.sendPasswordResetEmail(email: 'test@email.com'))
  //    .thenAnswer((_) => Future.value());
  //when(user.sendEmailVerification()).thenAnswer((_) => Future.value());
  //when(user.emailVerified).thenReturn(false);
  //setUp(() {
  //  //firebaseAuth = FirebaseAuthMock();
  //  //userCredential = UserCredentialMock();
  //  //user = UserMock();
//
  //  when(userCredential.user).thenReturn(user);
  //  when(firebaseAuth.signOut()).thenAnswer((_) => Future.value());
  //  when(user.delete()).thenAnswer((_) => Future.value());
  //  when(firebaseAuth.sendPasswordResetEmail(email: anyNamed('email') as String))
  //      .thenAnswer((_) => Future.value());
  //  when(user.sendEmailVerification()).thenAnswer((_) => Future.value());
  //  when(user.emailVerified).thenReturn(false);
  //});
  test('signInOrCreateAccount should return a user if sign in is successful',
      () async {
    when(firebaseAuth.signInWithEmailAndPassword(
            email: 'test@email.com',
            password: 'password'))
        .thenAnswer((_) => Future.value(userCredential));

    final returnedUser = await signInOrCreateAccount(
        MockBuildContext(),
        () => firebaseAuth.signInWithEmailAndPassword(
            email: 'test@email.com', password: 'password'),
        'email');

    expect(returnedUser, user);
  });

  test('signInOrCreateAccount should return null if sign in is unsuccessful',
      () async {
    when(firebaseAuth.signInWithEmailAndPassword(
            email: 'test@email.com',
            password: 'password'))
        .thenThrow(FirebaseAuthException(code: 'test', message: 'test'));

    final returnedUser = await signInOrCreateAccount(
        MockBuildContext(),
        () => firebaseAuth.signInWithEmailAndPassword(
            email: 'test@email.com', password: 'password'),
        'email');

    expect(returnedUser, null);
  });

  test('signOut should call FirebaseAuth.signOut()', () async {
    await signOut();
    verify(firebaseAuth.signOut()).called(1);
  });

  test('deleteUser should call User.delete()', () async {
    when(user.delete()).thenAnswer((_) => Future.value());
    when(firebaseAuth.currentUser).thenReturn(user);
    await deleteUser(MockBuildContext());
    verify(user.delete()).called(1);
  });

  test('resetPassword should call FirebaseAuth.sendPasswordResetEmail()',
      () async {
    await resetPassword(email: 'test@email.com', context: MockBuildContext());
    verify(firebaseAuth.sendPasswordResetEmail(email: 'test@email.com'))
        .called(1);
  });

  test('sendEmailVerification should call User.sendEmailVerification()',
      () async {
    when(firebaseAuth.currentUser).thenReturn(user);
    await sendEmailVerification();
    verify(user.sendEmailVerification()).called(1);
  });

  test('currentUserEmail should return the email of the current user', () {
    when(user.email).thenReturn('test@email.com');
    when(firebaseAuth.currentUser).thenReturn(user);
    expect(currentUserEmail, 'test@email.com');
  });

  test('currentUserUid should return the uid of the current user', () {
    when(user.uid).thenReturn('testUid');
    when(firebaseAuth.currentUser).thenReturn(user);
    expect(currentUserUid, 'testUid');
  });

  test(
      'currentUserDisplayName should return the display name of the current user',
      () {
    when(user.displayName).thenReturn('testDisplayName');
    when(firebaseAuth.currentUser).thenReturn(user);
    expect(currentUserDisplayName, 'testDisplayName');
  });

  test('currentUserPhoto should return the photo of the current user', () {
    when(user.photoURL).thenReturn('testPhoto');
    when(firebaseAuth.currentUser).thenReturn(user);
    expect(currentUserPhoto, 'testPhoto');
  });

  test('currentPhoneNumber should return the phone number of the current user',
      () {
    when(user.phoneNumber).thenReturn('1234567890');
    when(firebaseAuth.currentUser).thenReturn(user);
    expect(currentPhoneNumber, '1234567890');
  });
}
