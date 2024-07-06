import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/app_view_model.dart';

class TaskDetails extends StatelessWidget {
  TaskDetails({super.key, required this.taskTitle, required this.index});
  String taskTitle;
  int index;


  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: taskTitle);
    return Consumer<AppViewModel>(builder: (context, viewModel, child){
      return Scaffold(
          appBar: AppBar(
            shadowColor: Colors.grey,
            title: const Text(
              'Task Details', style: TextStyle(fontWeight: FontWeight.w600),),
          ),
          body: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(viewModel.getTime(index), style: TextStyle(fontSize: 25,
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w600),),
                    IconButton(onPressed: viewModel.check? (){
                      viewModel.onTapText(false);
                      viewModel.setUpdateText(controller.text, index);
                      FocusScope.of(context).unfocus();
                    }: null,
                        icon: Icon(
                          Icons.check,  color: viewModel.check? Colors.grey.shade900 : Colors.transparent, size: 30,))
                  ],
                ),
                Divider(height: 10, thickness: 2,),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: TextField(
                      controller: controller,
                      maxLines: null,
                      cursorColor: viewModel.clrLvl3,
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.grey.shade900),
                      decoration: InputDecoration(
                        filled: false,
                        border: OutlineInputBorder(borderSide: BorderSide.none)
                      ),
                      onTap: (){
                        viewModel.onTapText(true);
                      },

                    ),
                  ),
                ),
              ],
            ),
          )
      );
    });
  }
}
