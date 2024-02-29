

import 'package:flutter/material.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({
    super.key, required this.title,
    required this.icon,
    this.trailingIcon  = const Icon(Icons.arrow_forward_ios)
  });
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
        child:Column(
            children:[
              ListTile(
                leading: icon,
                title: Text(
                    title,
                    style:TextStyle(
                      fontWeight: FontWeight.bold,
                    )
                ),
                trailing:trailingIcon,
              ),
              Divider(color: Colors.grey.shade300,),
            ]

        )
    );
  }
}



