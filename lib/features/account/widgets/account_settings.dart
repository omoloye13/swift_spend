import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_spend/features/login/bloc/login_bloc.dart';
import 'package:swift_spend/features/login/screens/login_screen.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings(
      {super.key,
      required this.title,
      required this.icon,
      this.trailingIcon = const Icon(Icons.arrow_forward_ios)});
  final String title;
  final Widget icon;
  final Widget trailingIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(children: [
          ListTile(
            leading: icon,
            title: Text(title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            trailing: trailingIcon,
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.red.shade700,
            ),
            title: Text(
              "Log Out",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red.shade700,
              ),
            ),
            onTap: () {
              context.read<LoginBloc>().logout();
              Navigator.pushReplacement(
                context,
                LoginScreen.route(),
              );
            },
          )
        ]));
  }
}
