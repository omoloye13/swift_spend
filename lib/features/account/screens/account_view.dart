import 'package:flutter/material.dart';
import 'package:swift_spend/features/account/widgets/AccountToggle.dart';
import 'package:swift_spend/features/account/widgets/account_divider.dart';
import 'package:swift_spend/features/account/widgets/account_grid.dart';
import 'package:swift_spend/features/account/widgets/account_settings.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My account",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                fontSize:16,
              ),
            ),
            Text(
              "Fauziyat Folashade Omoloye",
              style: TextStyle(
                fontSize: 12.0,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
              color: Colors.blue,
              onPressed: (){},
              icon: Icon(
                Icons.account_circle,
                size: 40,
              )
          )
        ],
      ),
      body: ListView(
        children:[
          AccountToggle(),
          AccountGrid(),
          AccountDivider(
            icon: Icon(Icons.percent),
            title: "Today's rates",
            // trailingIcon,
          ),
          AccountDivider(
            icon: Icon(Icons.settings),
            title: "My account settings",
            // trailingIcon,

          ) ,
          AccountDivider(
            icon: Icon(Icons.shield_moon_rounded),
            title: "Enable dark mode ",
            // trailingIcon: Icon(Icons.switch_account),
              trailingIcon: Switch(
                value: false,
                onChanged: (value) {}
              )
          ),
          AccountDivider(
              icon: Icon(Icons.help),
            title: "Self Help",
            // trailingIcon
          ),
          AccountDivider(
              icon: Icon(Icons.security),
              title: "Security",
              // trailingIcon
          ),
          //other account settings
          SizedBox(height:30),
          AccountSettings(
            icon: Icon(Icons.card_giftcard_outlined, color: Colors.blue,),
            title: "Refer & Earn",
          ),
          AccountSettings(
            icon: Icon(Icons.settings),
            title: "Withdraw Funds",
          ),
          AccountSettings(
            icon: Icon(Icons.lock),
            title: "Linked Debit Cards",
          ),
          AccountSettings(
            icon: Icon(Icons.settings),
            title: "Withdrawal Bank",
          ),
          AccountSettings(
            icon: Icon(Icons.settings),
            title: "View PiggyVest Library",
          ),
          AccountSettings(
            icon: Icon(Icons.settings),
            title: "Change App Icon",
          ),
          AccountSettings(
            icon: Icon(Icons.phone),
            title: "Contact us",
          ),
          AccountSettings(
            icon: Icon(Icons.update_rounded),
            title: "Check for updates",
            // trailingIcon: "null",
          ),
          AccountSettings(
            icon: Icon(Icons.logout),
            title: "Logout",
          ),






        ]


    ),



    );
  }
}

