import 'package:equatable/equatable.dart';

//enum is used to keep track of the state of the status of user registration
enum SignupStatus { initial, Processing, Successful, Error }

class SignUpState extends Equatable {
  SignUpState({
    required this.fullName,
    required this.emailAdress,
    required this.password,
    required this.phoneNumber,
    this.signupStatus = SignupStatus.initial,
  });
// creting an initial variable for a signup state that is empty
  static SignUpState empty = SignUpState(
    fullName: '',
    emailAdress: '',
    password: '',
    phoneNumber: '',
    signupStatus: SignupStatus.initial,
  );

// creating final state variables for the input fields
  final String fullName;
  final String emailAdress;
  final String password;
  final String phoneNumber;
  final SignupStatus signupStatus;

  @override
  List<Object?> get props =>
      [fullName, emailAdress, password, phoneNumber, signupStatus];

//all the input fields should be represented in a copy with so hen the state changes they make a new copy of the state not that the state ill be newly created

  SignUpState copyWith({
    String? fullName,
    String? emailAdress,
    String? password,
    String? phoneNumber,
    SignupStatus? signupStatus,
  }) {
    return SignUpState(
      fullName: fullName ?? this.fullName,
      emailAdress: emailAdress ?? this.emailAdress,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      signupStatus: signupStatus ?? this.signupStatus,
    );
  }
}
