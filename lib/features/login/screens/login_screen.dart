import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_spend/features/home/screens/home_screen.dart';
import 'package:swift_spend/features/login/bloc/login_bloc.dart';
import 'package:swift_spend/features/login/bloc/login_state.dart';
import 'package:swift_spend/features/shared/widget/custom_text_field.dart';
import 'package:swift_spend/features/signup/screens/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static route() => MaterialPageRoute(
        builder: (context) {
          return LoginScreen();
        },
      );

  @override
  Widget build(BuildContext context) {
    var bloc = context.watch<LoginBloc>();
    var state = bloc.state;

    switch (state.loginStatus) {
      case LoginStatus.Initial:
        break;
      case LoginStatus.Processing:
        break;
      case LoginStatus.Successful:
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Navigator.pushReplacement(
            context,
            HomeScreen.route(),
          );
          bloc.reset();
        });
        break;
      case LoginStatus.Error:
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("An error occured")));
          bloc.resetStatusToInitial();
        });
        break;
      case LoginStatus.InvalidEmailAddress:
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("You entered and invalid email address")));
          bloc.resetStatusToInitial();
        });

        break;
      case LoginStatus.InvalidPassword:
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("You entered an invalid password")));
          bloc.resetStatusToInitial();
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
                    size: 80.0,
                  ))),
          Text('Login',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              )),
          Text('Securely login to your Swiftspend'),
          CustomTextField(
            label: 'Email Address',
            onChanged: (newText) {
              bloc.setEmailAddress(newText);
            },
          ),
          CustomTextField(
            label: 'Your Password',
            onChanged: (newText) {
              bloc.setPassword(newText);
            },
            isAPassword: true,
          ),
          SizedBox(
            height: 24,
          ),
          ElevatedButton(
              onPressed: () {
                bloc.onSubmit();
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
                  if (state.loginStatus == LoginStatus.Processing)
                    CircularProgressIndicator(),
                  Text("LOGIN"),
                ],
              )),
          TextButton(
            onPressed: () {
              // _navigateToLoginPage(context);
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return RegistrationScreen();
                }),
              );
            },
            child: Text("Don't have an account? Sign up"),
          ),
          TextButton(
            onPressed: () {},
            child: Text("Forgot your password?"),
          )
        ],
      )),
    );
  }
}
