// This file contains unit tests for the GetTasks use case.

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:to_do/domain/entities/task.dart';
import 'package:to_do/domain/repositories/task_repository.dart';
import 'package:to_do/domain/usecases/get_tasks.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  late GetTasks useCase;
  late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    useCase = GetTasks(mockTaskRepository);
  });

  test('should return a list of tasks from the repository', () async {
    // Arrange
    final tasks = [Task(title: 'Test Task', isCompleted: false)];
    when(mockTaskRepository.getTasks()).thenAnswer((_) async => tasks);

    // Act
    final result = await useCase();

    // Assert
    expect(result, tasks);
    verify(mockTaskRepository.getTasks());
    verifyNoMoreInteractions(mockTaskRepository);
  });
}
