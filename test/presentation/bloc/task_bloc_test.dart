import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:to_do/domain/entities/task.dart';
import 'package:to_do/domain/usecases/add_task.dart';
import 'package:to_do/domain/usecases/delete_task.dart';
import 'package:to_do/domain/usecases/get_tasks.dart';
import 'package:to_do/domain/usecases/update_task.dart';
import 'package:to_do/presentation/bloc/task_bloc.dart';
import 'package:to_do/presentation/bloc/task_event.dart';
import 'package:to_do/presentation/bloc/task_state.dart';

class MockGetTasks extends Mock implements GetTasks {}

class MockAddTask extends Mock implements AddTask {}

class MockDeleteTask extends Mock implements DeleteTask {}

class MockUpdateTask extends Mock implements UpdateTask {}

void main() {
  late TaskBloc bloc;
  late MockGetTasks mockGetTasks;
  late MockAddTask mockAddTask;
  late MockDeleteTask mockDeleteTask;
  late MockUpdateTask mockUpdateTask;

  setUp(() {
    mockGetTasks = MockGetTasks();
    mockAddTask = MockAddTask();
    mockDeleteTask = MockDeleteTask();
    mockUpdateTask = MockUpdateTask();
    bloc = TaskBloc(
      getTasks: mockGetTasks,
      addTask: mockAddTask,
      deleteTask: mockDeleteTask,
      updateTask: mockUpdateTask,
    );
  });

  blocTest<TaskBloc, TaskState>(
    'emits [TaskLoading, TaskLoaded] when LoadTasks is added',
    build: () {
      when(mockGetTasks()).thenAnswer((_) async => [
            Task(title: 'Task 1', isCompleted: false),
            Task(title: 'Task 2', isCompleted: true),
          ]);
      return bloc;
    },
    act: (bloc) => bloc.add(LoadTasks()),
    expect: () => [
      TaskLoading(),
      TaskLoaded(tasks: [
        Task(title: 'Task 1', isCompleted: false),
        Task(title: 'Task 2', isCompleted: true),
      ]),
    ],
  );

  blocTest<TaskBloc, TaskState>(
    'emits [TaskLoaded] when AddTask is added',
    build: () {
      when(mockAddTask(any)).thenAnswer((_) async {});
      return bloc;
    },
    act: (bloc) => bloc.add(AddTaskEvent(Task(title: 'New Task'))),
    expect: () => [
      isA<TaskLoaded>(),
    ],
  );

  blocTest<TaskBloc, TaskState>(
    'emits [TaskLoaded] when DeleteTask is added',
    build: () {
      when(mockDeleteTask(any)).thenAnswer((_) async {});
      return bloc;
    },
    act: (bloc) => bloc.add(DeleteTaskEvent(Task(title: 'Task to delete'))),
    expect: () => [
      isA<TaskLoaded>(),
    ],
  );
}
