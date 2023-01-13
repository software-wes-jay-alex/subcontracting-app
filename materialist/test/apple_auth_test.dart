//import 'package:flutter/services.dart';
//import 'package:flutter_test/flutter_test.dart';
//import 'package:materialist/auth/apple_auth.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
//import 'package:mockito/mockito.dart';
//
//class MockBuildContext extends Mock implements BuildContext {}
//
//void main() {
//  MockBuildContext _mockContext = MockBuildContext();
//  WidgetsFlutterBinding.ensureInitialized();
//  test('generateNonce() returns a string of the specified length', () {
//    expect(generateNonce(10).length, 10);
//    final nonce = generateNonce(32);
//    expect(nonce.length, 32);
//  });
//
//  test(
//      'sha256ofString() returns the correct sha256 hash of the input string in hex notation',
//      () {
//    final input = 'test';
//    final expectedHash =
//        '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08';
//    final hash = sha256ofString(input);
//    expect(hash, expectedHash);
//  });
//
//  test('appleSignIn() returns a UserCredential object when successful',
//      () async {
//    final credential = await appleSignIn();
//    expect(credential, isA<UserCredential>());
//  });
//
//  test('signInWithApple() returns a User object when successful', () async {
//    final user = await signInWithApple(_mockContext);
//    expect(user, isA<User>());
//  });
//
//  test('appleSignIn() and signInWithApple() throw an error when sign in fails',
//      () async {
//    try {
//      await appleSignIn();
//    } catch (error) {
//      expect(error, isA<PlatformException>());
//    }
//
//    try {
//      await signInWithApple(_mockContext);
//    } catch (error) {
//      expect(error, isA<PlatformException>());
//    }
//  });
//}
import 'package:flutter_test/flutter_test.dart';
import 'package:materialist/auth/apple_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  MockBuildContext _mockContext = MockBuildContext();
  WidgetsFlutterBinding.ensureInitialized();
  test('generateNonce() returns a string of the specified length', () {
    expect(generateNonce(10).length, 10);
  });

  test(
      'sha256ofString() returns the correct sha256 hash of the input string in hex notation',
      () {
    expect(sha256ofString('test'), '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08');
  });

  test('appleSignIn() returns a UserCredential object when successful', () async {
    final credential = await appleSignIn();
    expect(credential, isA<UserCredential>());
  });

  test('signInWithApple() returns a User object when successful', () async {
    final user = await signInWithApple(_mockContext);
    expect(user, isA<User>());
  });

  test('appleSignIn() and signInWithApple() throw an error when sign in fails',
      () {
    expect(appleSignIn(), throwsA(isA<Exception>()));
    expect(signInWithApple(_mockContext), throwsA(isA<Exception>()));
  });
}
