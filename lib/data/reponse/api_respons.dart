import 'package:mvvm_archi/data/reponse/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status,this.data,this.message);

  ApiResponse.loading() : status = Status.LOADING;


  ApiResponse.completed() : status = Status.COMPLETE;

  
  ApiResponse.error() : status = Status.ERROR;

  @override
  String toString(){
    return "STATUS : $status \nMessage: $message\nData: $data";

  }
}