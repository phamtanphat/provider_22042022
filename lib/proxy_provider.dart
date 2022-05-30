import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        body: MultiProvider(
          providers: [
            Provider(create: (context) => ApiService1()),
            ProxyProvider<ApiService1,Repository>(
                create: (context) => Repository(),
                update: (context, apiService, repository) {
                  repository!.updateApiService(apiService: apiService);
                  return repository;
                }
            ),
            ProxyProvider<Repository,DemoViewModel>(
                create: (context) => DemoViewModel(),
                update: (context, repository, viewModel) {
                  viewModel!.updateRepository(repository: repository);
                  return viewModel;
                }
            ),
          ],
            child: DemoProxyContainer()
        )
    );
  }
}

class DemoProxyContainer extends StatefulWidget {

  @override
  _DemoProxyContainerState createState() => _DemoProxyContainerState();
}

class _DemoProxyContainerState extends State<DemoProxyContainer> {
  late DemoViewModel  viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = context.read();
  }
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
                String data = viewModel.repository.apiService.callApi();
                print(data);
              },
              child: Text("Call Api")
          )
        ],
      ),
    );
  }
}
