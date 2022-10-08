import 'package:flutter/material.dart' hide Router;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:greenwave_app/app_module.dart';

void main() {
  runApp(ModularApp(module: AppModule()));
}
