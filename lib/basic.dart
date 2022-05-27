import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class BasicPage extends StatefulWidget {

  @override
  State<BasicPage> createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic Page"),
      ),
      body: Provider(
        create: (context) => 10,
        child: Container(
          child: Column(
            children: [
              Demo1(),
              Demo2()
            ],
          ),
        ),
      ),
    );
  }
}

class Demo1 extends StatelessWidget {
  const Demo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dang 1 : lay data tu context
    int value = context.read();
    return Container(
      child: Text("Demo 1 has value : $value"),
    );
  }
}

class Demo2 extends StatelessWidget {
  const Demo2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


