# to_do

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## File Structure

lib/
├── core/
│   ├── constants/
│   │   └── app_routes.dart 
│   └── utils/
│       └── validators.dart
│   └── themes/
│       └── dark_schemes.dart
│       └── light_schemes.dart
│       └── material_theme.dart
│       └── theme_utils.dart
├── data/
│   ├── datasources/
│   │   └── local_data_source.dart
│   ├── models/
│   │   └── task_model.dart
│   ├── repositories/
│       └── task_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── task.dart
│   ├── repositories/
│   │   └── task_repository.dart
│   ├── usecases/
│       └── add_task.dart
│       └── delete_task.dart
│       └── get_tasks.dart
│       └── update_task.dart
├── l10n/
│    ├── intl_en.arb
│    ├── intl_es.arb
├── presentation/
│    ├── bloc/
│    │   ├── task_bloc.dart
│    │   ├── task_event.dart
│    │   ├── task_state.dart
│    ├── pages/
│    │   └── task_page.dart
│    ├── widgets/
│        └── task_list.dart
│        └── task_item.dart
│
├── injection_container.dart
├── main.dart
