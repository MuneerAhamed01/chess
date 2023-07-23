// ignore_for_file: avoid_print

import 'dart:io';

import 'package:args/args.dart';

void main(List<String> args) {
  final ArgParser argParser = ArgParser();
  argParser.addOption('output', abbr: 'o', defaultsTo: '');
  argParser.addOption('name', abbr: 'n', defaultsTo: '');

  ArgResults argResults = argParser.parse(args);

  String outputPath = argResults['output'];
  String name = argResults['name'];

  if (outputPath.isEmpty) throw Exception("No path is Added");

  final path = outputPath.split('/').last;

  print('*** Dart Class Creator ***');

  final bindings = '''
import 'package:chess/views/$path/${path}_controller.dart';
import 'package:get/get.dart';


class ${name}Bindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<${name}Controller>(() => ${name}Controller());
  }
} 

''';

  final controller = '''
import 'package:get/get.dart';

class ${name}Controller extends GetxController {
  
} 
''';

  final screen = '''
import 'package:chess/views/$path/${path}_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class $name extends GetWidget<${name}Controller> {
const $name({super.key});

 @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Chess'),
      ),
    );
  }
  
} 
''';

  final bindingsPath = File('$outputPath/${path}_bindings.dart');
  final controllerPath = File('$outputPath/${path}_controller.dart');
  final screenPath = File('$outputPath/$path.dart');
  bindingsPath.createSync(recursive: true);
  bindingsPath.writeAsStringSync(bindings);
  print('*** Bindings Created ***');
  controllerPath.createSync(recursive: true);
  controllerPath.writeAsStringSync(controller);
  print('*** Controller Created ***');

  screenPath.createSync(recursive: true);
  screenPath.writeAsStringSync(screen);
  print('*** Screen Created ***');

  print('*** Successfully finished***');
}
