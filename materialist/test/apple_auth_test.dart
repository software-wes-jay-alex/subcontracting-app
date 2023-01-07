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

  test('appleSignIn() returns a Future<UserCredential> object when successful', () {
    expect(appleSignIn(), isA<Future<UserCredential>>());
  });

  test('signInWithApple() returns a Future<User?> object when successful', () {
    expect(signInWithApple(_mockContext), isA<Future<User?>>());
  });

  test('appleSignIn() and signInWithApple() throw an error when sign in fails',
      () {
    expect(appleSignIn(), throwsA(isA<Exception>()));
    expect(signInWithApple(_mockContext), throwsA(isA<Exception>()));
  });
}
