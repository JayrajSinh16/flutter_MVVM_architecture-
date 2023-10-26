import 'package:flutter/material.dart';
import 'package:mvvm_archi/respository/auth_respository.dart';
import 'package:mvvm_archi/utils/utils.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data,BuildContext context) async {

    setLoading(false);

    _myRepo.loginApi(data).then((value) {
       Utils.toastMessage("Login Succesfully");
      print(value.toString());
    }).onError((error, stackTrace) {
      Utils.toastMessage(error.toString());
      print(error.toString());
    });
  }
}