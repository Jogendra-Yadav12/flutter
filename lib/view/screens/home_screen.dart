import 'package:flutter/material.dart';
import 'package:mvvm_provider_setup/api/api_status.dart';
import 'package:mvvm_provider_setup/app/routes/routes_name.dart';
import 'package:mvvm_provider_setup/view_model/data_view_model.dart';
import 'package:mvvm_provider_setup/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DataViewModel dataViewModel = DataViewModel();
  @override
  void initState() {
    super.initState();
    dataViewModel.fetchDataList();
  }

  @override
  Widget build(BuildContext context) {
    final LoginViewModel loginViewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: InkWell(
              onTap: () {
                loginViewModel.remove().then((value) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RoutesName.loginScreen,
                    (route) => false,
                  );
                });
              },
              child: const Icon(Icons.logout),
            ),
          )
        ],
      ),
      body: ChangeNotifierProvider<DataViewModel>(
        create: (BuildContext context) => dataViewModel,
        child: Consumer<DataViewModel>(
          builder: (context, value, child) {
            switch (value.dataList.status) {
              // --------------------------- LOADING STATUS ---------------------------
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                );
              // --------------------------- ERROR STATUS ---------------------------
              case Status.error:
                return Center(
                  child: Text(
                    value.dataList.message.toString(),
                  ),
                );
              // --------------------------- COMPLETE STATUS ---------------------------
              case Status.complete:
                final data = value.dataList.data!.data;

                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(data[index].id.toString()),
                      title: Text(data[index].name),
                      subtitle: Text(data[index].pantoneValue),
                      trailing: Text(data[index].year.toString()),
                    );
                  },
                );
              case null:
                return const Text("Nothing");
            }
          },
        ),
      ),
    );
  }
}
