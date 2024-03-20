import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:swift_spend/features/home/bloc/home_bloc.dart';
//import 'package:swift_spend/features/home/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:swift_spend/features/login/bloc/login_bloc.dart';
import 'package:swift_spend/features/signup/bloc/signup_bloc.dart';
// import 'package:swift_spend/features/login/screens/login_screen.dart';
import 'package:swift_spend/features/signup/screens/registration_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => SignupBloc()),
        BlocProvider(create: (context) => LoginBloc()),
      ],
      // create: (BuildContext context) => HomeBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.grey.shade100,
        ),
        home: RegistrationScreen(),
      ),
    );
  }
}
