import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:to_do/domain/entities/task.dart';
import 'package:to_do/domain/repositories/task_repository.dart';
import 'package:to_do/domain/usecases/add_task.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  late AddTask useCase;
  late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    useCase = AddTask(mockTaskRepository);
  });

  test('should add a task to the repository', () async {
    // Arrange
    final task = Task(title: 'New Task', isCompleted: false);
    when(mockTaskRepository.addTask(task)).thenAnswer((_) async => null);

    // Act
    await useCase(task);

    // Assert
    verify(mockTaskRepository.addTask(task));
    verifyNoMoreInteractions(mockTaskRepository);
  });
}
