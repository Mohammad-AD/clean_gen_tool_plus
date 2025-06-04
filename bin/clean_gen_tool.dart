#!/usr/bin/env dart

import 'dart:io';

import 'package:args/args.dart';
import 'package:clean_gen_tool_plus/src/generator.dart';

void main(List<String> arguments) async {
  final parser = ArgParser()
    ..addOption('name', abbr: 'n', help: 'Project name')
    ..addFlag(
      'help',
      abbr: 'h',
      help: 'Show usage information',
      negatable: false,
    );

  try {
    final results = parser.parse(arguments);

    if (results['help'] as bool) {
      print(parser.usage);
      return;
    }

    final projectName =
        results['name'] as String? ?? Directory.current.path.split('/').last;

    print('🚀 Generating Flutter Clean Architecture project: $projectName');

    await CleanGenToolPlus.generate();

    print('✅ Project generated successfully!');
    print('👉 Next steps:');
    print('   cd $projectName');
    print('   flutter pub get');
  } catch (e) {
    stderr.writeln('❌ Error: $e');
    exitCode = 1;
  }
}
