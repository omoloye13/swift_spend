import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_spend/features/home/screens/home_screen.dart';
import 'package:swift_spend/features/login/screens/login_screen.dart';
import 'package:swift_spend/features/shared/widget/custom_text_field.dart';
import 'package:swift_spend/features/signup/bloc/signup_bloc.dart';
import 'package:swift_spend/features/signup/bloc/signup_state.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
// creating empty state variables for the input fields
  String fullName = '';
  String emailAdress = '';
  String password = '';
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    SignupBloc bloc = context.watch<SignupBloc>();
    SignUpState state = bloc.state;

    //using a switch statement
    switch (state.signupStatus) {
      case SignupStatus.initial:
        break;
      case SignupStatus.Processing:
        break;
      case SignupStatus.Successful:
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Navigator.pushReplacement(
            context,
            HomeScreen.route(),
          );
          bloc.reset();
        });
        break;
      case SignupStatus.Error:
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("An error occured")));
        });
        break;
    }
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.cancel_outlined,
                    size: 45.0,
                  ))),
          Text('Create Account',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              )),
          Text(
              'Create a free account and start a proper financial with Swiftspend'),
          CustomTextField(
              label: 'Full Name',
              onChanged: (newText) {
                fullName = newText;
              },
              textInputType: TextInputType.name),
          CustomTextField(
              label: 'Email Address',
              onChanged: (newText) {
                emailAdress = newText;
              },
              textInputType: TextInputType.emailAddress),
          CustomTextField(
              label: 'Phone Number',
              onChanged: (newText) {
                phoneNumber = newText;
              },
              textInputType: TextInputType.phone),
          CustomTextField(
              label: 'Password',
              onChanged: (newText) {
                password = newText;
              },
              isAPassword: true,
              textInputType: TextInputType.visiblePassword),
          SizedBox(
            height: 24,
          ),
          ElevatedButton(
              onPressed: state.signupStatus == SignupStatus.Processing
                  ? null
                  : () {
                      if (_isUserInputValid()) {
                        bloc.registerUser(
                          fullName: fullName,
                          emailAddress: emailAdress,
                          password: password,
                          phoneNumber: phoneNumber,
                        );
                      }
                    },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state.signupStatus == SignupStatus.Processing)
                    CircularProgressIndicator(),
                  Text("CREATE ACCOUNT"),
                ],
              )),
          TextButton(
            onPressed: () {
              _navigateToLoginPage(context);
            },
            child: Text("Already have an account? Log In"),
          )
        ],
      )),
    );
  }
//form validation for user inputs if it is valid

  bool _isUserInputValid() {
    String errorMessage = '';
    if (fullName.isEmpty) {
      errorMessage = 'Full name cannot be empty';
    } else if (emailAdress.isEmpty) {
      errorMessage = 'Email Address must not be empty ';
    } else if (password.isEmpty && password.length < 8) {
      errorMessage = 'Enter a Password greater than 8 characters';
    }

    if (errorMessage.isNotEmpty) {
      //to alert the error message to the user, we display it using a scaffold
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(errorMessage)));
      return false;
    }
    return true;
  }

  void _navigateToLoginPage(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return LoginScreen();
      },
    ));
  }
}
