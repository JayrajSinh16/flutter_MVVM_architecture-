import 'package:flutter/material.dart';
import 'package:mvvm_archi/respository/auth_respository.dart';
import 'package:mvvm_archi/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);

    _myRepo.loginApi(data).then((value) {
      setLoading(true);
      Utils.toastMessage("Login Succesfully");
      print(value.toString());
    }).onError((error, stackTrace) {
      setLoading(true);
      Utils.toastMessage(error.toString());
      print(error.toString());
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);

    _myRepo.signUpApi(data).then((value) {
      setSignUpLoading(false);
      Utils.toastMessage("SignUp Succesfully");
      print(value.toString());
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      Utils.toastMessage(error.toString());
      print(error.toString());
    });
  }
}
