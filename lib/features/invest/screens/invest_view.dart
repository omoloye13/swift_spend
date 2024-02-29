import 'package:flutter/material.dart';
import 'package:swift_spend/features/home/widgets/vetted_opportunities_section.dart';
import 'package:swift_spend/features/invest/widgets/invest_details_card.dart';
import 'package:swift_spend/features/invest/widgets/tab_section.dart';

class Invest extends StatelessWidget {
  const Invest({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Investments"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: Icon(Icons.info_outline_rounded),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          InvestDetailsCard(),
          Divider(),
          VettedOpportunitiesSection(),
          TabSection(),
        ],
      ),
    );
  }
}
