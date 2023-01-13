import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInMock extends Mock implements GoogleSignIn {}

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

class UserCredentialMock extends Mock implements UserCredential {}

class UserMock extends Mock implements User {}

class GoogleAuthProviderMock extends Mock implements GoogleAuthProvider {}

void main() {
  GoogleSignInMock googleSignIn;
  FirebaseAuthMock firebaseAuth;
  UserCredentialMock userCredential;
  UserMock user;
  GoogleAuthProviderMock googleAuthProvider;

  setUp(() {
    googleSignIn = GoogleSignInMock();
    firebaseAuth = FirebaseAuthMock();
    userCredential = UserCredentialMock();
    user = UserMock();
    googleAuthProvider = GoogleAuthProviderMock();
  });

  test('signInWithGoogle should sign in with google', () async {
    // Arrange
    googleSignIn = GoogleSignInMock();
    firebaseAuth = FirebaseAuthMock();
    userCredential = UserCredentialMock();
    user = UserMock();
    googleAuthProvider = GoogleAuthProviderMock();
    when(googleSignIn.signIn()).thenAnswer((_) async => userCredential);
    when(userCredential.authentication)
        .thenAnswer((_) => GoogleAuthProviderMock());
    when(firebaseAuth.signInWithCredential(googleAuthProvider))
        .thenAnswer((_) async => userCredential);
    when(userCredential.user).thenAnswer((_) => user);

    // Act
    final result = await signInWithGoogle(null);

    // Assert
    expect(result, user);
    verify(googleSignIn.signIn());
    verify(userCredential.authentication);
    verify(firebaseAuth.signInWithCredential(googleAuthProvider));
    verify(userCredential.user);
  });

  test('signInWithGoogle should sign out if user is already signed in',
      () async {
    // Arrange
    googleSignIn = GoogleSignInMock();
    firebaseAuth = FirebaseAuthMock();
    userCredential = UserCredentialMock();
    user = UserMock();
    googleAuthProvider = GoogleAuthProviderMock();
    when(googleSignIn.signIn()).thenAnswer((_) async => userCredential);

    // Act
    await signInWithGoogle(null);

    // Assert
    verify(googleSignIn.signOut());
  });

  test('signInWithGoogle should return null if authentication is null',
      () async {
    // Arrange
    googleSignIn = GoogleSignInMock();
    firebaseAuth = FirebaseAuthMock();
    userCredential = UserCredentialMock();
    user = UserMock();
    googleAuthProvider = GoogleAuthProviderMock();
    when(googleSignIn.signIn()).thenAnswer((_) async => userCredential);
    when(userCredential.authentication).thenAnswer((_) => null);

    // Act
    final result = await signInWithGoogle(null);

    // Assert
    expect(result, null);
    verify(googleSignIn.signIn());
    verify(userCredential.authentication);
  });

  test('signOutWithGoogle should sign out with google', () async {
    googleSignIn = GoogleSignInMock();
    firebaseAuth = FirebaseAuthMock();
    userCredential = UserCredentialMock();
    user = UserMock();
    googleAuthProvider = GoogleAuthProviderMock();
    
    // Act
    await signOutWithGoogle();

    // Assert
    verify(googleSignIn.signOut());
  });
}
