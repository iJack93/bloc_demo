part of 'complete_todo_bloc.dart';

abstract class CompleteTodosState extends Equatable {
  const CompleteTodosState();

  @override
  List<Object> get props => [];
}

class CompleteTodoInitial extends CompleteTodosState { }

class CompleteTodoLoading extends CompleteTodosState { }

class CompleteTodoDone extends CompleteTodosState { }

class TodoError extends CompleteTodosState {
  final String? message;
  final String? errorCode;
  final String? code;

  const TodoError({
    required this.message,
    this.errorCode,
    this.code,
  });
}
