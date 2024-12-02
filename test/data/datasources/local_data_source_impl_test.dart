import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mockito/mockito.dart';
import 'package:to_do/data/datasources/local_data_source_impl.dart';
import 'package:to_do/data/models/task_model.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  group('LocalDataSourceImpl Tests', () {
    late LocalDataSourceImpl dataSource;
    late MockSharedPreferences mockSharedPreferences;

    setUp(() {
      // Create a mock SharedPreferences instance
      mockSharedPreferences = MockSharedPreferences();
      dataSource = LocalDataSourceImpl(mockSharedPreferences);
    });

    test('getTasks returns tasks from SharedPreferences', () async {
      // Sample task data
      final taskList = [
        TaskModel(title: 'Test Task 1', isCompleted: false),
        TaskModel(title: 'Test Task 2', isCompleted: true),
      ];

      // Mock the SharedPreferences behavior to return a JSON string
      when(mockSharedPreferences.getString('tasks')).thenReturn(
          json.encode(taskList.map((task) => task.toJson()).toList()));

      // Call getTasks method
      final result = await dataSource.getTasks();

      // Verify the result is a list of TaskModel
      expect(result, isA<List<TaskModel>>());
      expect(result.length, equals(2));
      expect(result[0].title, equals('Test Task 1'));
      expect(result[1].isCompleted, equals(true));
    });

    test('getTasks returns empty list if no tasks are stored', () async {
      // Mock SharedPreferences to return null (no tasks saved)
      when(mockSharedPreferences.getString('tasks')).thenReturn(null);

      // Call getTasks method
      final result = await dataSource.getTasks();

      // Verify the result is an empty list
      expect(result, isEmpty);
    });

    /* test('saveTasks stores tasks in SharedPreferences', () async {
      final taskList = [
        TaskModel(title: 'Task to Save', isCompleted: false),
      ];

      // Mock SharedPreferences to always return true for setString
      when(mockSharedPreferences.setString(
        captureThat(isNotNull) ?? "",
        captureThat(isNotNull) ?? "",
      )).thenAnswer((_) async => true);

      // Call saveTasks method
      await dataSource.saveTasks(taskList);

      // Verify that SharedPreferences setString was called with the right arguments
      verify(mockSharedPreferences.setString('tasks',
              json.encode(taskList.map((task) => task.toJson()).toList())))
          .called(1);
    });

    test('deleteTasks removes tasks from SharedPreferences', () async {
      // Mock SharedPreferences to always return true for remove
      when(mockSharedPreferences.remove(any ?? ""))
          .thenAnswer((_) async => true);

      // Call deleteTasks method
      await dataSource.deleteTasks();

      // Verify that remove was called to delete 'tasks'
      verify(mockSharedPreferences.remove('tasks')).called(1);
    });

    test('updateTask updates an existing task', () async {
      final existingTask = TaskModel(title: 'Old Task', isCompleted: false);
      final updatedTask = TaskModel(title: 'Updated Task', isCompleted: true);

      // Mock the SharedPreferences to return the existing task list
      when(mockSharedPreferences.getString('tasks'))
          .thenReturn(json.encode([existingTask.toJson()]));

      // Mock the saveTasks method
      when(mockSharedPreferences.setString(any ?? "", any ?? ""))
          .thenAnswer((_) async => true);

      // Call updateTask method
      await dataSource.updateTask(updatedTask);

      // Verify that the task is updated and saved
      verify(mockSharedPreferences.setString(
          'tasks', json.encode([updatedTask.toJson()]))).called(1);
    }); */

    test('updateTask throws error if task not found', () async {
      final updatedTask = TaskModel(title: 'Updated Task', isCompleted: true);

      // Mock the SharedPreferences to return an empty task list
      when(mockSharedPreferences.getString('tasks'))
          .thenReturn(json.encode([]));

      // Call updateTask and expect an exception
      expect(() async => await dataSource.updateTask(updatedTask),
          throwsException);
    });
  });
}
