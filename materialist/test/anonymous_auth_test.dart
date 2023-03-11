import 'package:flutter_test/flutter_test.dart';
import 'package:materialist/auth/anonymous_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  Future _initialize = Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  //Firebase.initializeApp();
  //MyClass sut;
  //MockBuildContext _mockContext;

  //setUp(() {
    //sut = MyClass();
    //_mockContext = MockBuildContext();
  //});
  
  MockBuildContext _mockContext = MockBuildContext();
  
  test('signInAnonymously() returns a Future<User?> object when successful', () {
    expect(signInAnonymously(_mockContext), isA<Future<User?>>());
  });

  test('signInAnonymously() throws an error when sign in fails', () {
    expect(signInAnonymously(_mockContext), throwsA(isA<Exception>()));
  });
}
