import 'package:componentes/src/flavor_values.dart';
import 'package:flutter/material.dart';

class FlavorConfig {
  factory FlavorConfig({
    required FlavorValues flavorValues,
    required Flavor flavor,
    Color color: Colors.blue,
  }) {
    _instance =
        FlavorConfig._internal(flavor, flavor.toString(), color, flavorValues);
    return _instance;
  }

  FlavorConfig._internal(this.flavor, this.name, this.color, this.values);

  final FlavorValues values;
  final Flavor flavor;
  final String name;
  final Color color;
  static FlavorConfig _instance = FlavorConfig._internal(
      Flavor.development, '', Colors.blue, FlavorValues(baseUrl: ''));
}

enum Flavor {
  development,
  qa,
  production,
}
