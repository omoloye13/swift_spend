

import 'package:flutter/cupertino.dart';

class suggestion_section extends StatelessWidget {
  const suggestion_section({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        child:Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children:[
              Text(
                "Suggestions for you",
                style: TextStyle(
                    // color: Colors.black38,
                    fontSize: 24,
                ),

              ),
              Container(
                height:150,
                
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection:Axis.horizontal,
                  children: [
                    Image.asset("assets/images/save_for_rent.png"),
                    Image.asset("assets/images/save_for_vacation.png"),
                    Image.asset("assets/images/save_for_business.png"),

                  ],
                ),
              )
            ]
        )
    );
  }
}
