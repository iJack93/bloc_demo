import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../data/models/todo.dart';
import '../../data/repositories/database_repository.dart';

part 'complete_todo_event.dart';
part 'complete_todo_state.dart';

class CompleteTodoBloc extends Bloc<CompleteTodoEvent, CompleteTodosState> {

  final DatabaseRepository _databaseRepository = DatabaseRepository();

  CompleteTodoBloc() : super(CompleteTodoInitial()) {
    on<CompleteTodoEvent>((event, emit) async {
      await _updateTodo(event, emit);
    });
  }

  Future<void> _updateTodo(CompleteTodoEvent event, Emitter<CompleteTodosState> emit) async {
    try {
      await _databaseRepository.updateTodo(event.todo);
      emit(CompleteTodoDone());
    } on FirebaseException catch (error) {
      emit(TodoError(
        message: error.message,
        code: error.code
      ));
    }
  }

}
