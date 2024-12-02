import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../datasources/local_data_source.dart';
import '../models/task_model.dart';

/// Implementation of the [TaskRepository] interface.
///
/// This repository acts as a bridge between the domain layer and the data layer,
/// providing a clean interface for the domain layer while interacting with the
/// [LocalDataSource] to manage task data.
class TaskRepositoryImpl implements TaskRepository {
  /// The data source used to manage local storage of tasks.
  final LocalDataSource localDataSource;

  /// Constructor to initialize the repository with a [LocalDataSource].
  TaskRepositoryImpl(this.localDataSource);

  /// Retrieves the list of tasks from the local data source.
  ///
  /// Converts the data from [TaskModel] to the [Task] entity format
  /// required by the domain layer.
  ///
  /// Returns a [Future] containing a list of [Task] entities.
  @override
  Future<List<Task>> getTasks() async {
    // Fetch task models from the local data source.
    final taskModels = await localDataSource.getTasks();

    // Map the task models to task entities and return them as a list.
    return taskModels
        .map((taskModel) =>
            Task(title: taskModel.title, isCompleted: taskModel.isCompleted))
        .toList();
  }

  /// Saves a list of tasks to the local data source.
  ///
  /// Converts the data from [Task] entities to [TaskModel] format
  /// required by the data layer before saving.
  ///
  /// Parameters:
  /// - [tasks]: A list of [Task] entities to be saved.
  @override
  Future<void> saveTasks(List<Task> tasks) async {
    // Map the task entities to task models for the local data source.
    final models = tasks
        .map((task) => TaskModel(
              title: task.title,
              isCompleted: task.isCompleted,
            ))
        .toList();

    // Save the task models to the local data source.
    return localDataSource.saveTasks(models);
  }
}
