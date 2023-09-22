import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/todo.dart';
import '../../data/repositories/database_repository.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {

  final DatabaseRepository _databaseRepository = DatabaseRepository();

  TodosBloc() : super(TodosInitial()) {
    on<AddTodoEvent>((event, emit) async {
      await _addTodo(event, emit);
    });
    on<LoadTodos>((event, emit) async {
      await _loadTodos(event, emit);
    });
  }

  Future<void> _addTodo(AddTodoEvent event, Emitter<TodosState> emit) async {
    try {
      await _databaseRepository.addTodo(event.todo);
      emit(TodoAdded());
      add(LoadTodos());
    } on FirebaseException catch (error) {
      emit(TodoError(
        message: error.message,
        code: error.code
      ));
    }
  }

  Future<void> _loadTodos(LoadTodos event, Emitter<TodosState> emit) async {
    emit(TodosLoading());

    //only for demonstration purposes
    // await Future.delayed(const Duration(seconds: 5));

    try {
      List<Todo> todos = await _databaseRepository.getTodos();
      todos.sort((a, b) => int.parse(b.createdAt!).compareTo(int.parse(a.createdAt!)));
      emit(TodosLoaded(todos: todos));
    } on FirebaseException catch (error) {
      emit(TodoError(
        message: error.message,
        code: error.code
      ));
    }
  }

}
