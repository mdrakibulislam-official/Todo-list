import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskDetails extends StatelessWidget {
  TaskDetails({super.key, required this.taskTitle, required this.time});
  String taskTitle;
  String time;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.grey,
        title: const Text('Task Details',style: TextStyle(fontWeight: FontWeight.w600),),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(time,style: TextStyle(fontSize: 25,color: Colors.grey.shade800,fontWeight: FontWeight.w600),),
            Divider(height: 10,thickness: 2,),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SelectableText(taskTitle,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,
                    color: Colors.grey.shade900),),
              ),
            ),
          ],
        ),
      )
    );
  }
}
