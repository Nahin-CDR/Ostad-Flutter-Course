import 'package:get/get.dart';
import 'package:task_manager/api/networkResponse.dart';
import 'package:task_manager/services/networkCaller.dart';
import '../models/summaryCountModel.dart';
import '../utility/urls.dart';

class SummaryController extends GetxController{
  bool _getCountSummaryInProgress = false;
  SummaryCountModel _summaryCountModel = SummaryCountModel();
  String message = "";
  bool get getCountSummaryInProgress => _getCountSummaryInProgress;
  SummaryCountModel get summaryCountModel => _summaryCountModel;

  Future<bool>getCountSummary()async{
    _getCountSummaryInProgress = true;
    update();
    final NetworkResponse networkResponse = await NetworkCaller().getRequest(Urls.taskStatusCount);
    _getCountSummaryInProgress = false;
    if(networkResponse.isSuccess){
      _summaryCountModel = SummaryCountModel.fromJson(networkResponse.body!);
      update();
      return true;
    }else{
      message = 'Count summary get failed! Try again.';
      update();
      return false;
    }
  }
}