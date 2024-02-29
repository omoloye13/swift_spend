
import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.title,
    required this.progress,
    this.onPressed
  });
  final String title;
  final double progress;
  final Function() ?onPressed;  //making this nullable i.e. optional
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16.0),
        margin: EdgeInsets.only(right:16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          // color: Colors.white
        ),
        width: 150,
        // color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,

                ),

              ),
              LinearProgressIndicator(

                value: progress,
              ),
              IconButton(
                onPressed: onPressed,
                icon: Icon(Icons.arrow_forward_ios, size:20),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,

                ),


              )
            ]
        )
    );
  }
}
