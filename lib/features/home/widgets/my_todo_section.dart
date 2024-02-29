import 'package:flutter/material.dart';
import 'package:swift_spend/features/home/widgets/hide_todo_sheet.dart';
import 'package:swift_spend/features/home/widgets/todo_item.dart';

class MyTodoSection extends StatelessWidget {
  const MyTodoSection({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Header Row Start
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "My Todo",
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 24,
                  )
              ),
              TextButton(
                onPressed: (){
                  showModalBottomSheet(
                    showDragHandle:true,
                      context: context,
                      builder:(context){
                        return HideTodoSheet();
                      }
                  );
                },
                child: Row(
                  children: [
                    Text(
                        "Hide",
                        style: TextStyle(color : Colors.red.shade700)
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Colors.red,
                    )
                  ],
                ),

              )
            ],
          ),
          //List View Start
          //ListView Start
          SizedBox(
            height: 140,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                TodoItem(
                  title: "Add Debit Card",
                  progress: 0.3,
                ),
                TodoItem(
                  title: "Enable Autosave",
                  progress: 0.9,
                ),
                TodoItem(
                  title: "Enable face id/fingerprint",
                  progress: 0,
                ),
                TodoItem(
                  title: "Add a Picture",
                  progress: 0,
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}

