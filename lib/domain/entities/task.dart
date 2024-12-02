/// Represents a task entity in the domain layer.
///
/// This class defines the core properties of a task, independent of any specific
/// implementation details or data storage mechanisms.
class Task {
  /// The title or name of the task.
  final String title;

  /// Indicates whether the task has been completed.
  final bool isCompleted;

  /// Constructor to create a [Task] instance.
  ///
  /// Parameters:
  /// - [title]: The title of the task (required).
  /// - [isCompleted]: The completion status of the task (required).
  Task({required this.title, required this.isCompleted});
}
