//what a repository layer usually does is that it aggregates ll data source helps us access data

import 'package:firebase_auth/firebase_auth.dart';

class SignupRepository {
  //initializing an instance of firebase auth
  var auth = FirebaseAuth.instance;
  Future<void> registerUser(
      {required String email, required String password}) async {
    // await auth.signInWithPhoneNumber(phoneNumber: phoneNumber);

    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }
}
