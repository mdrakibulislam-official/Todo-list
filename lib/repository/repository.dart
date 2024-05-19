import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/task_model.dart';

class Repository{
  late SharedPreferences preferences;
  //User name section
  String username = "";

  Future<void> setUserName(String newUserName) async {
    preferences = await SharedPreferences.getInstance();
    preferences.setString("username", newUserName);
  }

  Future<String> getUsername() async {
    preferences = await SharedPreferences.getInstance();
    username = preferences.getString("username") ?? "Md. Rakibul Islam";
    return username;
  }

  //Task list section
  List<Task> tasked = <Task>[];

  void setTaskList(List<Task> task) async {
    print("setTaskList is initialized");
    print(task);
    preferences = await SharedPreferences.getInstance();

    //new method applying
    List<String> items = task.map((item) => json.encode(item.toMap())).toList();
    preferences.setStringList('list', items);

  }

  Future<List<Task>> getTaskList() async {
    preferences = await SharedPreferences.getInstance();

    List<String>? listString = preferences.getStringList('list');
    if (listString != null) {
      tasked =
          listString.map((item) => Task.fromMap(json.decode(item))).toList();
      print("Get Data From preference");
      print(tasked);
      return tasked;

    } else {
      print("Get Data From preference Null");
      print(tasked);
      return tasked;
    }
  }

  //Delete all task list
  Future<void> deleteAll() async {
    preferences = await SharedPreferences.getInstance();
    preferences.remove('list');
  }

}