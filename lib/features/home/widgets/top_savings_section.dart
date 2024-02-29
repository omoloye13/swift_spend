


import 'package:flutter/material.dart';

class TopSavingsSection extends StatelessWidget {
  const TopSavingsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.all(16.0),
      // color: Colors.white,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "Top Savings",
            style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          )
          ),
          ListTile(
            leading: Icon(
                Icons.money
            ),
            title: Text("Piggy Bank"),
            subtitle: Text("Auto Save: Daily, Weekly or Monthly"),
            trailing: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // Background color
                ),
                child: Text(
                    "Save",
                  style: TextStyle(
                  color: Colors.blue, // Text color
                  backgroundColor: Colors.white, // Background color
                ),
                )
            ),
          ),
          ListTile(
            leading: Icon(
                Icons.money
            ),
            title: Text("Safe Lock"),
            subtitle: Text("Lock funds to avoid temptation"),
            trailing: ElevatedButton(onPressed: (){},
                child: Text(
                    "Lock",
                  style: TextStyle(
                    color: Colors.blue, // Text color
                    backgroundColor: Colors.white, // Background color
                  ),
            )),
          ),
          ListTile(
            leading: Icon(
                Icons.money
            ),
            title: Text("Flex Naira"),
            subtitle: Text("Your emergency funds with interests"),
            trailing: ElevatedButton(onPressed: (){},
                child: Text(
                    "Fund",
                  style: TextStyle(
                    color: Colors.blue, // Text color
                    backgroundColor: Colors.white, // Background color
                  ),

                )
            ),
          )
        ],
      ),
    );
  }
}