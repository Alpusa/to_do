import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:to_do/domain/entities/task.dart';
import 'package:to_do/domain/repositories/task_repository.dart';
import 'package:to_do/domain/usecases/delete_task.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  late DeleteTask useCase;
  late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    useCase = DeleteTask(mockTaskRepository);
  });

  test('should delete a task from the repository', () async {
    // Arrange
    final task = Task(title: 'Task to delete', isCompleted: false);
    when(mockTaskRepository.deleteTask(task)).thenAnswer((_) async => null);

    // Act
    await useCase(task);

    // Assert
    verify(mockTaskRepository.deleteTask(task));
    verifyNoMoreInteractions(mockTaskRepository);
  });
}
