import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do/presentation/widgets/task_item.dart';
import 'package:to_do/domain/entities/task.dart';

void main() {
  testWidgets('should render task item correctly', (WidgetTester tester) async {
    // Arrange
    final task = Task(title: 'Test Task', isCompleted: false);

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: TaskItem(
          task: task,
          onToggle: (_) {},
          onDelete: () {},
        ),
      ),
    );

    // Assert
    expect(find.text('Test Task'), findsOneWidget);
    expect(find.byType(Checkbox), findsOneWidget);
  });
}
