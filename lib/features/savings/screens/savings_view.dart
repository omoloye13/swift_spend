import 'package:flutter/material.dart';
import 'package:swift_spend/features/home/widgets/saving_details_card.dart';
import 'package:swift_spend/features/savings/screens/quick_save_page.dart';
import 'package:swift_spend/features/savings/widgets/strict_savings_section.dart';

class SavingsView extends StatelessWidget {
  const SavingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Savings"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.info_outline_rounded)
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SavingDetailsCard(
            balance: "\$24000",
            topRightWidget: Chip(
              label: Text(
                "up to 13% returns",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.black,
              shape: StadiumBorder(),
            ),
        onClick: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context){
              return QuickSavePage();
            }),
          );
        },
      ),


          StrictSavingsSection(),
        ],
      ),
    );
  }
}