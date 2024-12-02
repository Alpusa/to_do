import 'package:flutter_test/flutter_test.dart';
import 'package:to_do/domain/entities/task.dart';

void main() {
  test('should create a Task instance', () {
    // Arrange
    final task = Task(title: 'Test Task', isCompleted: false);

    // Assert
    expect(task.title, 'Test Task');
    expect(task.isCompleted, false);
  });
}
