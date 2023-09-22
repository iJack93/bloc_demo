import 'package:bloc_demo/data/models/todo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IDatabaseServiceInterface {
  Future<QuerySnapshot<Object?>> getTodos();
  Future<void> addTodo(Todo todo);
  Future<void> updateTodo(Todo todo);
}