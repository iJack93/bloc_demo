part of 'todos_bloc.dart';

abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

class TodosInitial extends TodosState { }

class TodosLoading extends TodosState { }

class TodosLoaded extends TodosState {
  final List<Todo> todos;

  const TodosLoaded({
    required this.todos,
  });

  @override
  List<Object> get props => [todos];
}

class TodoAdded extends TodosState { }

class TodoError extends TodosState {
  final String? message;
  final String? errorCode;
  final String? code;

  const TodoError({
    required this.message,
    this.errorCode,
    this.code,
  });
}
