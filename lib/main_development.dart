import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import 'my_app_intro.dart';

void main() {
  var values = <String, dynamic>{'environment': 'Soy development'};

  FlavorConfig(
    color: Colors.yellow,
    variables: values,
  );

  runApp(MyApp());
}
