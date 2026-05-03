import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

final authServiceProvider = Provider((ref) => AuthService());

class AuthService {
  final _auth = FirebaseAuth.instance;
  final _signIn = GoogleSignIn.instance;

  Future<void> initialize() async {
    await _signIn.initialize();
    _signIn.authenticationEvents.listen(_handleAuthEvent);
    _signIn.attemptLightweightAuthentication();
  }

  Future<void> _handleAuthEvent(GoogleSignInAuthenticationEvent event) async {
    if (event is GoogleSignInAuthenticationEventSignIn) {
      final googleAuth = event.user.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(credential);
    } else if (event is GoogleSignInAuthenticationEventSignOut) {
      await _auth.signOut();
    }
  }

  Future<void> signInWithGoogle() async {
    if (_signIn.supportsAuthenticate()) {
      await _signIn.authenticate();
    }
  }

  Future<void> signOut() async {
    await _signIn.signOut();
  }
}
