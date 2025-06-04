/// A tool for generating Clean Architecture folders and files for Dart/Flutter projects.
///
/// This library exports the [CleanGenTool] class which can be used to
/// scaffold Clean Architecture components like `data_layer`, `core_layer`, and more.
///
/// Example usage:
/// ```dart
/// import 'package:clean_gen_tool/clean_gen_tool.dart';
///
/// final generator = CleanGenTool();
/// await generator.generate();
/// ```
library clean_gen_tool;

export 'src/generator.dart';
