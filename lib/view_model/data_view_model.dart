import 'package:flutter/material.dart';
import 'package:mvvm_provider_setup/api/api_response.dart';
import 'package:mvvm_provider_setup/model/data_model.dart';
import 'package:mvvm_provider_setup/repository/data_repository.dart';

class DataViewModel with ChangeNotifier {
  final DataRepository _dataRepo;
  DataViewModel() : _dataRepo = DataRepository();
  ApiResponse<DataModel> dataList = ApiResponse.loading();
  setDataList(ApiResponse<DataModel> response) {
    dataList = response;
    notifyListeners();
  }

  Future<void> fetchDataList() async {
    setDataList(ApiResponse.loading());

    _dataRepo.getDataApi().then((value) {
      setDataList(ApiResponse.complete(value));
    }).onError((error, stackTrace) {
      setDataList(ApiResponse.error(error.toString()));
    });
  }
}
