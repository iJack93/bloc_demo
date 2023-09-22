import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bloc_demo/data/interfaces/database_service_interface.dart';

import '../models/todo.dart';

class DatabaseService implements IDatabaseServiceInterface {
  //singleton variables
  DatabaseService._();
  static final DatabaseService shared = DatabaseService._();

  //default singleton factory constructor
  factory DatabaseService() {
    return shared;
  }

  final CollectionReference _todos = FirebaseFirestore.instance.collection("todos");
  CollectionReference get todos => _todos;

  final Timestamp _timestamp = Timestamp.now();
  Timestamp get timestamp => _timestamp;

  @override
  Future<QuerySnapshot<Object?>> getTodos() {
    return _todos.get();
  }

  @override
  Future<void> addTodo(Todo todo) async {
    _todos.doc(todo.id).set(todo.toJson());
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    _todos.doc(todo.id).update(todo.toJson());
  }

}