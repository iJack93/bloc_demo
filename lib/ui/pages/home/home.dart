import 'package:bloc_demo/blocs/todos_bloc/todos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/todo.dart';
import '../../../utilities/extensions.dart';

import '../../styles/styles.dart';
import '../add_todo/add_todo_page.dart';
import 'cells/todo_cell.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final PropertyValueNotifier<List<Todo>> _todos = PropertyValueNotifier<List<Todo>>([]);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        SystemChannels.textInput.invokeMethod("TextInput.hide");
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Styles.blue1,
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700
            ),
          ),
          actions: [
            IconButton(
              padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
              onPressed: () {
                context.read<TodosBloc>().add(LoadTodos());
              },
              icon: const Icon(Icons.refresh, color: Colors.white, size: 30,),
            )
          ],
        ),
        body: BlocConsumer<TodosBloc, TodosState>(
          listener: (context, state) {
            if (state is TodoAdded) {
              _showSnackbar(context);
            }
          },
          builder: (context, state) {
            if (state is TodosInitial || state is TodosLoading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is TodosLoaded) {
              List<Todo> todos = state.todos;
              _todos.value = todos;
              if(todos.isNotEmpty) {
                return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    Todo todo = todos[index];
                    if(index < todos.length) {
                      return TodoCell(todo: todo);
                    } else {
                      return Container();
                    }
                  },
                );
              } else {
                return const Center(child: Text("Evviva!\nNon hai cose da fare", textAlign: TextAlign.center),);
              }
            } else {
              return Container();
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (builder) => const AddTodoPage()));
          },
          backgroundColor: Styles.blue1,
          child: const Icon(Icons.add, color: Colors.white, size: 36,),
        ),
      ),
    );
  }

  void _showSnackbar(BuildContext context) {
    SnackBar snackBar = const SnackBar(
      content: Text(
        'Todo aggiunta!',
        style: TextStyle(
            color: Colors.white
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}