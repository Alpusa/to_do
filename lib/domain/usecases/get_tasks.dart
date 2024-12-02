import '../repositories/task_repository.dart';
import '../entities/task.dart';

// This file defines the use case for retrieving tasks.
class GetTasks {
  final TaskRepository repository;

  GetTasks(this.repository);

  Future<List<Task>> call() async {
    return await repository.getTasks();
  }
}
