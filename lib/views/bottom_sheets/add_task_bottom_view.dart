import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/task_model.dart';
import '../../view_models/app_view_model.dart';

class AddTaskBottomSheetView extends StatelessWidget {
  const AddTaskBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController entryController = TextEditingController();

    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Padding(
        padding:
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom,top: 5),
        child: SizedBox(
          height: 80,
          width: double.maxFinite,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextField(

                      onSubmitted: (value) {
                        if (entryController.text.isNotEmpty) {
                          var now = DateTime.now();
                          var formatter = DateFormat('yyyy-MM-dd');
                          String formattedDate = formatter.format(now);
                          print(formattedDate);
                          Task newTask = Task(title: entryController.text, complete: false, time: formattedDate);
                          viewModel.addTask(newTask);
                          entryController.clear();
                        }
                        Navigator.of(context).pop();
                      },
                      minLines: 1,
                      maxLines: 3,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 5),
                          filled: true,
                          fillColor: viewModel.clrLvl2,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none))
                      ),
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: viewModel.clrLvl4,
                      autofocus: true,
                      autocorrect: false,
                      controller: entryController,
                      style: TextStyle(
                          color: viewModel.clrLvl4, fontWeight: FontWeight.w500)),
                ),
                TextButton(onPressed: (){
                  if (entryController.text.isNotEmpty) {
                    var now = DateTime.now();
                    var formatter = DateFormat('yyyy-MM-dd');
                    String formattedDate = formatter.format(now);
                    print(formattedDate);
                    Task newTask = Task(title: entryController.text, complete: false,time: formattedDate);
                    viewModel.addTask(newTask);
                    entryController.clear();
                  }
                  Navigator.of(context).pop();
                },style: TextButton.styleFrom(backgroundColor: Colors.blue,foregroundColor: Colors.white), child:  const Text("save",style: TextStyle(fontSize: 18),),)
              ],
            ),
          ),
        ),
      );
    });
  }
}