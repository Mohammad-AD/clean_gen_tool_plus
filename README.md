[![Pub Version](https://img.shields.io/pub/v/clean_gen_tool_plus)](https://pub.dev/packages/clean_gen_tool_plus)
[![Publisher](https://img.shields.io/pub/publisher/clean_gen_tool_plus)](https://pub.dev/packages/clean_gen_tool_plus/publisher)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# Clean Gen Tool Plus
---
# How To Use

First add the package to your pubspec.yaml:
```yaml
dependencies:
  clean_gen_tool_plus: ^1.0.4
```
---
Or run the following command in your terminal:
With Dart:
```bash
  dart pub add clean_gen_tool_plus
```
---
With Flutter:
```bash
  flutter pub add clean_gen_tool_plus
```
---
Import it
```bash
  import 'package:clean_gen_tool_plus/clean_gen_tool_plus.dart';
```
---
Create a new file named `gen_tool.dart` in the `lib` directory of your Flutter project.
and add the following code to it:
```dart
import 'package:clean_gen_tool_plus/clean_gen_tool_plus.dart';

 void main() async {
   await CleanGenToolPlus.generate();
 }
```
---
Then run the generator tool to generate the necessary files and structure:
```bash
  dart run lib/gen_tool.dart
```
---
# Documentation:
## Clean Architecture

This project is a base Flutter Clean Architecture template demonstrating best practices in project
structure,
state management, and scalable app development.

It includes:

- A sample Login screen
- Implementation of Bloc/Cubit for state management
- Robust error handling (network errors, failures, exceptions)
- Well-structured repository pattern
- Base Repository for clean code implementation
- Well-structured network pattern
- PrettyDioLogger for the best dio logging for debuggers
- Offline Builder in case internet went off
- A ready to use General Layer to help use in the app :
    * constants / routing / theme / env settings / offline builder / shared preference / Queue Request / utils 
    * services like Dio, SharedPreferences, Connectivity, and more 
    * extensions for common types
    * routing with auto_route
    * Dependency Injection using get_it
  and many many more
- A ready to use responsive layouts and builders
  * check rs_seek plugin for examples on how to implement responsive layouts
The project is built following the Clean Architecture principles, broken down into three main
layers:

* business_layer – Manages state using (Bloc)
* data_layer – Handles models, networking, and repositories
* general_layer – Contains constants, services, utilities, routing, and more
* Dependency Injection – Uses get_it for service locator pattern
* Features – Organized by feature, each with its own presentation layer

## Structure

```
Structure A-Conceptual
lib/
├── core/
│   ├── business_layer/
│   ├── data_layer/
│   └── general_layer/
├── features/
│   ├── onboarding/
│   └── splash/
├── app.dart
├── app_bloc_observer.dart
└── main.dart
```

```
Structure B - Current
lib/
├── core/
│   ├── business_layer/
│   │   └── cubit/
│   │       ├── category/
│   │       ├── locale/
│   │       ├── login/        
│   │       └── theme/
│   │   └── bloc/
│   │       └── login/
│   ├── data_layer/
│   │   ├── errors/
│   │   ├── models/
│   │   │   └── category/
│   │   ├── network/
│   │   └── repository/
│   │       ├── base/
│   │       └── category/
│   └── general_layer/
│       ├── constants/
│       ├── extensions/
│       ├── routing/
│       ├── services/
│       ├── theme/
│       └── utils/
├── features/
│   ├── home/
│   │   └── presentation/
│   │       └── screens/
│   ├── login/               
│   │   └── presentation/
│   │       └── screens/
│   ├── onboarding/
│   │   └── presentation/
│   │       └── screens/
│   └── splash/
│       └── presentation/
│           └── screens/
└── generated/
```

## Getting Started

```bash
flutter pub get
flutter run
```

---

## For the use of Git : (Main Git Commands)

```bash
git init
git add .
git remote add origin 'Repository Url'
git commit -m 'Type : Message'

git pull / git fetch origin
git push origin 'branchName'
git push origin 'branchName':'branchName2' --force

git status
git log
git branch
git merge 'branchName'

git checkout 'branchName'
git checkout -b 'branchName'
```

---

## To generate a new structure into a .txt file

```bash
dart lib/generate_structure.dart > structure.txt
```

---

## Credits
Built with ❤️ by Mohammad Al-Adarbi
Contact: richardchalger@gmail.com
