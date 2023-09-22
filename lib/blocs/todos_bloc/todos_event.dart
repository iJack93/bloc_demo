part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object?> get props => [];
}

class AddTodoEvent extends TodosEvent {
  final Todo todo;

  const AddTodoEvent({
    required this.todo,
  });

  @override
  List<Object?> get props => [todo];
}

class LoadTodos extends TodosEvent { }