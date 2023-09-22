part of 'complete_todo_bloc.dart';

abstract class UpdateTodoEvent extends Equatable {
  const UpdateTodoEvent();

  @override
  List<Object?> get props => [];
}

class CompleteTodoEvent extends UpdateTodoEvent {
  final Todo todo;

  const CompleteTodoEvent({
    required this.todo,
  });

  @override
  List<Object?> get props => [todo];
}