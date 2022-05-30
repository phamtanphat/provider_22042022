import 'package:flutter/material.dart';
import 'package:provider_22042022/basic.dart';
import 'package:provider_22042022/proxy_provider.dart';

import 'demo_changenotifier_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DemoProxyProvider()
    );
  }
}
