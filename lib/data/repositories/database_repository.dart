import '../models/todo.dart';
import '../services/database_service.dart';

class DatabaseRepository {
  //singleton variables
  DatabaseRepository._();
  static final DatabaseRepository shared = DatabaseRepository._();

  //default singleton factory constructor
  factory DatabaseRepository() {
    return shared;
  }

  final DatabaseService _databaseService = DatabaseService();

  Future<List<Todo>> getTodos() async {
    List<Todo> results = [];
    final rawData = await _databaseService.getTodos();
    for(var doc in rawData.docs) {
      Todo todo = Todo.fromJson(doc.data());
      results.add(todo);
    }
    return results;
  }

  Future<void> addTodo(Todo todo) {
    return _databaseService.addTodo(todo);
  }

  Future<void> updateTodo(Todo todo) {
    return _databaseService.updateTodo(todo);
  }

}