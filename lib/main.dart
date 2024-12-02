// This is the entry point of the Flutter application.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/presentation/bloc/task_event.dart';
import 'generated/l10n.dart';
import 'injection_container.dart' as di;
import 'presentation/bloc/task_bloc.dart';
import 'presentation/pages/task_page.dart';
import './core/themes/material_theme.dart';

Future<void> main() async {
  // Ensure all bindings are initialized before running the app.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection.
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const MaterialTheme materialTheme = MaterialTheme();
    return MaterialApp(
      title: "To Do",
      debugShowCheckedModeBanner: false,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: materialTheme.light(), // Usar tema claro
      darkTheme: materialTheme.dark(), // Usar tema oscuro
      themeMode: ThemeMode.light, // Establecer modo claro por defecto
      home: BlocProvider(
        create: (_) => di.sl<TaskBloc>()..add(LoadTasks()),
        child: TaskPage(),
      ),
    );
  }
}
