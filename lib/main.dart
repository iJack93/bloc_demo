import 'package:bloc_demo/ui/pages/home/home.dart';
import 'package:bloc_demo/ui/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/complete_todo_bloc/complete_todo_bloc.dart';
import 'blocs/todos_bloc/todos_bloc.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.signInAnonymously();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodosBloc>(
          create: (context) => TodosBloc()..add(LoadTodos()),
        ),
        BlocProvider<CompleteTodoBloc>(
          create: (context) => CompleteTodoBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'TO-DO List',
        debugShowCheckedModeBanner: false,
        theme: Styles.mainThemeData(),
        home: const MyHomePage(title: 'TO-DO List'),
      ),
    );
  }
}