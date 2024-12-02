// This file defines the main task page UI.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/domain/entities/task.dart';
import '../../core/utils/validators.dart';
import '../../generated/l10n.dart';
import '../bloc/task_bloc.dart';
import '../bloc/task_event.dart';
import '../bloc/task_state.dart';
import '../widgets/task_list.dart';

class TaskPage extends StatelessWidget {
  TaskPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    var tr = S.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: Text(tr.app_name),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onSurface,
        ),
      ),
      body: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Text(tr.task_filter, style: theme.textTheme.titleMedium),
                const SizedBox(height: 5),
                BlocBuilder<TaskBloc, TaskState>(
                  builder: (context, state) {
                    if (state is TaskLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is TaskLoaded) {
                      return ToggleButtons(
                        direction: Axis.horizontal,
                        onPressed: (int index) {
                          context.read<TaskBloc>().add(ChangeToggleEvent());
                        },
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        selectedBorderColor: theme.colorScheme.primary,
                        selectedColor: theme.colorScheme.primaryFixed,
                        fillColor: theme.colorScheme.primaryContainer,
                        color: theme.colorScheme.primary,
                        constraints: const BoxConstraints(
                          minHeight: 40.0,
                        ),
                        isSelected: [!state.showCompleted, state.showCompleted],
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              right: 5,
                              left: 5,
                            ),
                            child: Text(
                              tr.pending,
                              style: theme.textTheme.titleSmall?.copyWith(
                                color: theme.colorScheme.onPrimaryContainer,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              right: 5,
                              left: 5,
                            ),
                            child: Text(
                              tr.completed,
                              style: theme.textTheme.titleSmall?.copyWith(
                                color: theme.colorScheme.onPrimaryContainer,
                              ),
                            ),
                          ),
                        ],
                      );
                    } else if (state is TaskError) {
                      return Center(child: Text(state.message));
                    } else {
                      return const Center(child: Text('No tasks found.'));
                    }
                  },
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: BlocBuilder<TaskBloc, TaskState>(
                    builder: (context, state) {
                      if (state is TaskLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is TaskLoaded) {
                        return TaskList(
                          tasks: state.showCompleted
                              ? state.tasksCompleted
                              : state.tasks,
                          checkFunction: (p0) {
                            context
                                .read<TaskBloc>()
                                .add(ChangeStatusTaskEvent(p0));
                          },
                          deleteFunction: (task) {
                            context.read<TaskBloc>().add(DeleteTaskEvent(task));
                          },
                        );
                      } else if (state is TaskError) {
                        return Center(child: Text(state.message));
                      } else {
                        return const Center(child: Text('No tasks found.'));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 15,
                      right: 15,
                      left: 15,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.outline,
                          blurRadius: 10.0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: _inputController,
                        validator: Validators.requiredField,
                        decoration: InputDecoration(
                          hintText: tr.add_new_task,
                          hintStyle: TextStyle(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15, right: 15),
                  child: FloatingActionButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        context.read<TaskBloc>().add(AddTaskEvent(Task(
                            title: _inputController.text, isCompleted: false)));
                        _inputController.clear();
                      }
                    },
                    highlightElevation: 20,
                    backgroundColor: theme.colorScheme.inversePrimary,
                    elevation: 10,
                    hoverElevation: 10,
                    splashColor:
                        theme.colorScheme.inversePrimary.withOpacity(0.2),
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: theme.colorScheme.onPrimaryFixed,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
