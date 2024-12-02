import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:to_do/data/datasources/local_data_source.dart';
import 'package:to_do/data/models/task_model.dart';
import 'package:to_do/data/repositories/task_repository_impl.dart';
import 'package:to_do/domain/entities/task.dart';

// We create a mock of LocalDataSource
class MockLocalDataSource extends Mock implements LocalDataSource {}

void main() {
  late TaskRepositoryImpl taskRepository;
  late MockLocalDataSource mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    taskRepository = TaskRepositoryImpl(mockLocalDataSource);
  });

  group('TaskRepositoryImpl', () {
    test('should get tasks from local data source', () async {
      // We prepare the expected data for the mock response.
      final mockTasks = [
        TaskModel(title: 'Task 1', isCompleted: false),
        TaskModel(title: 'Task 2', isCompleted: true),
      ];

      // Configure the mock to return the expected data
      when(mockLocalDataSource.getTasks()).thenAnswer((_) async => mockTasks);

      // We call the method we are testing
      final tasks = await taskRepository.getTasks();

      // We verify that the method of localDataSource has been called correctly
      verify(mockLocalDataSource.getTasks()).called(1);

      // We verify that the result is as expected
      expect(tasks, isA<List<Task>>());
      expect(tasks.length, 2);
      expect(tasks[0].title, 'Task 1');
      expect(tasks[1].isCompleted, true);
    });

    test('should save tasks to local data source', () async {
      // Create the tasks to be saved
      final tasksToSave = [
        Task(title: 'Task 1', isCompleted: false),
        Task(title: 'Task 2', isCompleted: true),
      ];

      // We call the method we are testing
      await taskRepository.saveTasks(tasksToSave);

      // We verify that the saveTasks method of LocalDataSource has been called properly
      verify(mockLocalDataSource.saveTasks(any)).called(1);

      // We check that the tasks have been correctly mapped to TaskModel
      final capturedArgs =
          verify(mockLocalDataSource.saveTasks(captureAny)).captured;
      final savedTasks = capturedArgs.first as List<TaskModel>;

      expect(savedTasks, isA<List<TaskModel>>());
      expect(savedTasks[0].title, 'Task 1');
      expect(savedTasks[1].isCompleted, true);
    });
  });
}
