import 'package:assignment_manager/data/models/response_model.dart';
import 'package:assignment_manager/data/services/api_service.dart';
import 'package:assignment_manager/data/utils/network_const.dart';
import 'package:get/get.dart';

import '../../data/models/all_task_model.dart';


class AllTaskController extends GetxController{
  var allData = AllTaskModel();
  bool _inProgress = false;
  String? _errorMessage;
  List<Data>dataList = List<Data>.empty().obs;
  @override
  void onInit(){
    super.onInit();
    allTask();
  }

  bool get inProgress => _inProgress;
  String get errorMessage => _errorMessage ?? 'Internet failed! Try again';

  Future<AllTaskModel> allTask() async{
    _inProgress = true;
    update();
    ResponseModel response = await ApiService.getRequest(NetworkConst.allTask);
    _inProgress = false;
    if(response.statusCode == 200){
      update();
    //  print(response.responseBody.toString());
       allData = AllTaskModel.fromJson(response.responseBody);
      for(int i=0;i< allData.data!.length;i++){
        dataList.add(allData.data![i]);
      }
      print(dataList.length.toString());

      return allData;

    }else{
      print('No Data Show');
      _errorMessage = response.errorMessage;
      update();
      return allData;
    }
  }

}