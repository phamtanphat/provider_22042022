import 'dart:math';
import 'package:flutter/material.dart';

class ApiService1 {
  String callApi() {
    var random = Random();
    if (random.nextBool()) {
      return "Call api success";
    } else {
      return "Fail exception";
    }
  }
}

class Repository {
  late ApiService1 apiService;

  Repository();

  void updateApiService({ApiService1? apiService}) {
    this.apiService = apiService!;
  }

  void handleRequest() {
    apiService.callApi();
  }
}

class DemoViewModel {
  late Repository repository;

  DemoViewModel();

  void updateRepository({Repository? repository}) {
    this.repository = repository!;
  }

  void performRequest() {
    repository.handleRequest();
  }
}

class DemoProxyProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Demo Proxy"),
        ),
        body: DemoProxyContainer()
    );
  }
}

class DemoProxyContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
      constraints: BoxConstraints.expand(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Data"),
          ElevatedButton(
              onPressed: (){

              },
              child: Text("Call Api")
          )
        ],
      ),
    );
  }
}
