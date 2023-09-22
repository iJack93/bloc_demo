import 'package:bloc_demo/blocs/complete_todo_bloc/complete_todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/todo.dart';
import '../../../components/custom_checkbox.dart';

class TodoCell extends StatelessWidget {

  final Todo todo;

  const TodoCell({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            blurRadius: 8.0,
            spreadRadius: 0.0,
            offset: const Offset(
              0.0, 2.0,
            ),
          ),
        ]
      ),
      child: ListTile(
        leading: CustomCheckbox(
          selected: todo.done ?? false,
          onChanged: (bool done) {
            todo.done = done;
            context.read<CompleteTodoBloc>().add(CompleteTodoEvent(todo: todo));
          },
        ),
        title: Text(
          todo.content ?? "",
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}
