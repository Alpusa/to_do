# to_do

A simple and efficient local task manager app built with Flutter.

## Introduction

This application is a local task manager that helps users organize and track their pending tasks. It offers basic task management functionalities such as adding, removing, completing, and filtering tasks. The data is stored locally, ensuring that tasks persist even after the app is closed and reopened.

## Features

- **Task List**: Displays a clear list of pending tasks.
- **Add Task**: Allows users to add new tasks.
- **Delete Task**: Lets users remove tasks from the list.
- **Mark Task as Completed**: Marks tasks as completed when done.
- **Filter Tasks**: Filters tasks by their status (pending/completed).
- **Data Persistence**: Tasks are saved and remain accessible after closing and reopening the app.

## Getting Started

### Prerequisites

Make sure you have Flutter installed on your machine. If you don't have it yet, follow the instructions in the official Flutter documentation to get started.

- [Install Flutter](https://flutter.dev/docs/get-started/install)
- [Flutter Documentation](https://flutter.dev/docs)

### Installing

1. Clone this repository to your local machine:
   ```bash
   git clone https://github.com/your-username/to_do.git

2. Navigate to the project directory:
   ```bash
   cd to_do

3. To run the app, use the following command:
   ```bash
   flutter run

## Example Usage

Upon launching the app, you will see the task list page. Here, you can view, add, or remove tasks.

### Adding a Task:
Tap the "Add Task" button, enter the task details, and save it. The task will appear in the list.

### Marking a Task as Completed:
Tap on a task to mark it as completed.

### Filtering Tasks:
You can filter tasks to see only pending or completed ones by using the filter options.

### Deleting a Task:
To remove a task, click the trash can button that appears next to each task.

## Screenshots
Below are some screenshots of how the app looks and functions:

### Home Screen - Task List
![Home Screen](https://github.com/Alpusa/to_do/blob/main/images/noCompleted.jpg)

### Task Completed
![Task Completed](https://github.com/Alpusa/to_do/blob/main/images/Completed.jpg)

## File Structure
The project is structured as follows:

```plaintext
lib/
├── core/
│   ├── constants/
│   │   └── app_routes.dart 
│   ├── utils/
│   │   └── validators.dart
│   ├── themes/
│   │   └── dark_schemes.dart
│   │   └── light_schemes.dart
│   │   └── material_theme.dart
│   │   └── theme_utils.dart
├── data/
│   ├── datasources/
│   │   └── local_data_source.dart
│   ├── models/
│   │   └── task_model.dart
│   ├── repositories/
│   │   └── task_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── task.dart
│   ├── repositories/
│   │   └── task_repository.dart
│   ├── usecases/
│   │   └── add_task.dart
│   │   └── delete_task.dart
│   │   └── get_tasks.dart
│   │   └── update_task.dart
├── generated/
│   ├── intl
│   │   └── messages_all.dart
│   │   └── messages_en.dart
│   │   └── messages_es.dart
│   ├── l10n.dart
├── l10n/
│   ├── intl_en.arb
│   ├── intl_es.arb
├── presentation/
│   ├── bloc/
│   │   ├── task_bloc.dart
│   │   ├── task_event.dart
│   │   ├── task_state.dart
│   ├── pages/
│   │   └── task_page.dart
│   ├── widgets/
│   │   └── task_list.dart
│   │   └── task_item.dart
├── injection_container.dart
├── main.dart



## Contributing

Feel free to fork this repository and submit pull requests. If you encounter any issues or have suggestions, please open an issue in the [Issues section](https://github.com/your-username/to_do/issues).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
