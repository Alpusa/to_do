import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:to_do/domain/entities/task.dart';
import 'package:to_do/domain/repositories/task_repository.dart';
import 'package:to_do/domain/usecases/update_task.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  late UpdateTask useCase;
  late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    useCase = UpdateTask(mockTaskRepository);
  });

  test('should update a task in the repository', () async {
    // Arrange
    final task = Task(title: 'Updated Task', isCompleted: true);
    when(mockTaskRepository.updateTask(task)).thenAnswer((_) async => null);

    // Act
    await useCase(task);

    // Assert
    verify(mockTaskRepository.updateTask(task));
    verifyNoMoreInteractions(mockTaskRepository);
  });
}
