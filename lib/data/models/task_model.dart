import 'dart:convert';
import '../../domain/entities/task.dart';

/// [TaskModel] is a data model class that extends the [Task] entity.
///
/// It provides additional functionality for JSON serialization and deserialization,
/// as well as utility methods to handle task data.
class TaskModel extends Task {
  /// Creates a [TaskModel] instance with the required title and completion status.
  TaskModel({required super.title, required super.isCompleted});

  /// Creates a copy of the current [TaskModel] with optional updates.
  ///
  /// Parameters:
  /// - [title]: Optional new title for the task.
  /// - [isCompleted]: Optional new completion status for the task.
  ///
  /// Returns a new [TaskModel] with updated properties or the original values.
  TaskModel copyWith({
    String? title,
    bool? isCompleted,
  }) =>
      TaskModel(
        title: title ?? this.title,
        isCompleted: isCompleted ?? this.isCompleted,
      );

  /// Factory constructor to create a [TaskModel] from a raw JSON string.
  ///
  /// Parses the provided [str] and maps it to a [TaskModel] instance.
  factory TaskModel.fromRawJson(String str) =>
      TaskModel.fromJson(json.decode(str));

  /// Converts the current [TaskModel] to a raw JSON string.
  ///
  /// Returns a JSON-encoded string representation of the task.
  String toRawJson() => json.encode(toJson());

  /// Factory constructor to create a [TaskModel] from a JSON map.
  ///
  /// Parameters:
  /// - [json]: A map containing the task properties (title and isCompleted).
  ///
  /// Returns a new [TaskModel] instance.
  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        title: json["title"],
        isCompleted: json["isCompleted"],
      );

  /// Converts the current [TaskModel] to a JSON map.
  ///
  /// Returns a map with keys "title" and "isCompleted" representing the task.
  Map<String, dynamic> toJson() => {
        "title": title,
        "isCompleted": isCompleted,
      };

  /// Overrides the equality operator to compare two [TaskModel] objects.
  ///
  /// Two tasks are considered equal if they have the same [title] and [isCompleted] values.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TaskModel) return false;
    return other.title == title && other.isCompleted == isCompleted;
  }

  /// Overrides the hashCode getter to provide a unique hash for the task.
  ///
  /// Combines the hash codes of the [title] and [isCompleted] properties.
  @override
  int get hashCode => title.hashCode ^ isCompleted.hashCode;
}
