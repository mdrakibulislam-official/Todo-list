import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/repository/repository.dart';
import 'package:todo_list/views/task_page.dart';

import 'view_models/app_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Repository newRep = Repository();
  final list = await newRep.getTaskList();
  runApp(ChangeNotifierProvider(
      create: (context) => AppViewModel(list), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskPage(),
    );
  }
}