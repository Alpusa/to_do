// This file sets up dependency injection for the application.

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/datasources/local_data_source.dart';
import 'data/datasources/local_data_source_impl.dart';
import 'data/repositories/task_repository_impl.dart';
import 'domain/repositories/task_repository.dart';
import 'domain/usecases/add_task.dart';
import 'domain/usecases/change_status_task.dart';
import 'domain/usecases/delete_task.dart';
import 'domain/usecases/get_tasks.dart';
import 'domain/usecases/update_task.dart';
import 'presentation/bloc/task_bloc.dart';

final sl = GetIt.instance; // Service locator instance.

Future<void> init() async {
  // Data sources
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(sl()));

  // Bloc
  sl.registerFactory(() => TaskBloc(
        getTasks: sl(),
        addTask: sl(),
        deleteTask: sl(),
        updateTask: sl(),
        changeStatusTask: sl(),
      ));

  // Use cases
  sl.registerLazySingleton(() => GetTasks(sl()));
  sl.registerLazySingleton(() => AddTask(sl()));
  sl.registerLazySingleton(() => DeleteTask(sl()));
  sl.registerLazySingleton(() => UpdateTask(sl()));
  sl.registerLazySingleton(() => ChangeStatusTask(sl()));

  // Repository
  sl.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImpl(sl()),
  );
}
