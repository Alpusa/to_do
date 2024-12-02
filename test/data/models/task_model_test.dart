import 'package:flutter_test/flutter_test.dart';
import 'package:to_do/data/models/task_model.dart';

void main() {
  // Test for the creation of the TaskModel
  test('TaskModel should create a valid task', () {
    final task = TaskModel(title: 'Test Task', isCompleted: false);

    expect(task.title, 'Test Task');
    expect(task.isCompleted, false);
  });

  // Test for TaskModel to JSON conversion
  test('TaskModel should convert to JSON correctly', () {
    final task = TaskModel(title: 'Test Task', isCompleted: false);

    final jsonMap = task.toJson();

    expect(jsonMap, {
      'title': 'Test Task',
      'isCompleted': false,
    });
  });

  // Test for JSON to TaskModel conversion
  test('TaskModel should create from JSON correctly', () {
    const jsonString = '{"title": "Test Task", "isCompleted": false}';
    final task = TaskModel.fromRawJson(jsonString);

    expect(task.title, 'Test Task');
    expect(task.isCompleted, false);
  });

  // Test for TaskModel to JSON and back conversion
  test('TaskModel should convert to JSON and back correctly', () {
    final task = TaskModel(title: 'Test Task', isCompleted: true);

    final jsonString = task.toRawJson();
    final taskFromJson = TaskModel.fromRawJson(jsonString);

    expect(taskFromJson.title, 'Test Task');
    expect(taskFromJson.isCompleted, true);
  });

  // Test for copyWith method
  test('TaskModel should copy with modified values', () {
    final task = TaskModel(title: 'Test Task', isCompleted: false);
    final copiedTask = task.copyWith(isCompleted: true);

    expect(copiedTask.title, 'Test Task');
    expect(copiedTask.isCompleted, true);
  });

  // Test for the comparison of two instances of TaskModel
  test('TaskModel should compare equality correctly', () {
    final task1 = TaskModel(title: 'Test Task', isCompleted: false);
    final task2 = TaskModel(title: 'Test Task', isCompleted: false);
    final task3 = TaskModel(title: 'Another Task', isCompleted: false);

    expect(task1, task2); // Equality by title and completed status
    expect(task1, isNot(task3)); // Different task
  });

  // Test for hashCode property
  test('TaskModel should have correct hashCode', () {
    final task1 = TaskModel(title: 'Test Task', isCompleted: false);
    final task2 = TaskModel(title: 'Test Task', isCompleted: false);

    expect(task1.hashCode, task2.hashCode);
  });
}
