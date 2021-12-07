import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ArtShackFirebaseUser {
  ArtShackFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

ArtShackFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ArtShackFirebaseUser> artShackFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ArtShackFirebaseUser>(
            (user) => currentUser = ArtShackFirebaseUser(user));
