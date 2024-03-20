import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_spend/features/signup/bloc/signup_state.dart';
import 'package:swift_spend/features/signup/repository/signup_repository.dart';

class SignupBloc extends Cubit<SignUpState> {
//we need to pass an initial state whenever we create our block

  SignupBloc() : super(SignUpState.empty);

  SignupRepository signupRepository = SignupRepository();

  //function to reset the state to the initial state
  void reset() {
    emit(SignUpState.empty);
  }

// create a function that takes the four paameters(input field) and binds it to the signup state
  void registerUser(
      {required String fullName,
      required String emailAddress,
      required String password,
      required String phoneNumber}) async {
    //to show processing/loading state
    emit(state.copyWith(signupStatus: SignupStatus.Processing));

    try {
      await signupRepository.registerUser(
        email: emailAddress,
        password: password,
        // phoneNumber: phoneNumber,
      );

      emit(state.copyWith(signupStatus: SignupStatus.Successful));
    } on FirebaseAuthException catch (e) {
      print("Got to firebase error section");
      emit(state.copyWith(signupStatus: SignupStatus.Error));
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print("Got to error section");
      emit(state.copyWith(signupStatus: SignupStatus.Error));
      print(e);
    }
  }
}
