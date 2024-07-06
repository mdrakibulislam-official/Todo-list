import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/views/task_details/task_details.dart';

import '../view_models/app_view_model.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Container(
          decoration: BoxDecoration(
              color: viewModel.clrLvl2,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
          child: ListView.separated(
            padding: EdgeInsets.all(15),
            separatorBuilder: (context, index) {
              return SizedBox(height: 15);
            },
            //viewModel method numTask
            itemCount: viewModel.numTasks,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  HapticFeedback.mediumImpact();
                  //viewModel method deleteTask
                  viewModel.deleteTask(index);
                },
                background: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: Colors.red.shade300,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Icon(Icons.delete, color: Colors.red.shade700)),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height/15,
                  decoration: BoxDecoration(
                      color: viewModel.clrLvl1,
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    onTap: (){
                      viewModel.onTapText(false);
                      Navigator.push(context,
                          PageTransition(child: TaskDetails(taskTitle: viewModel.getTaskTitle(index), index: index,), type: PageTransitionType.rightToLeft));
                    },
                      leading: FutureBuilder(
                          initialData: viewModel.getTaskValue(index),
                          builder: (context, str) {
                            return Checkbox(
                                checkColor: viewModel.clrLvl1,
                                activeColor: viewModel.clrLvl3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(
                                      width: 2, color: viewModel.clrLvl3),
                                ),
                                value: str.requireData,
                                onChanged: (value) {
                                  viewModel.setTaskValue(index, value!);
                                });
                          }, future: null,),
                      //viewModel method getTaskTitle
                      title: FutureBuilder(
                        //future: viewModel.getTextTitle(index),
                          initialData: viewModel.getTaskTitle(index),
                          //future: viewModel.getTextTitle(index),
                          builder: (context, str) {
                            return Text(
                              str.requireData.toString(),
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: viewModel.clrLvl4),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            );
                          }, future: null,)),
                ),
              );
            }

    ));
    });
  }
}