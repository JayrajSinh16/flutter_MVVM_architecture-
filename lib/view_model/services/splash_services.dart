import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_archi/model/user_model.dart';
import 'package:mvvm_archi/utils/routes/route_name.dart';
import 'package:mvvm_archi/view_model/user_view_model.dart';

class SplashServices {
  
  Future<UserModel> getUserData() => UserViewModel().getUser();


  void checkAuth(BuildContext context) async{

    getUserData().then((value)async{

      print(value.token.toString());


      if(value.token.toString() == 'null' || value.token.toString() == ''){
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RouteName.login);
      }else {
        await  Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RouteName.home);
      }
    }).onError((error, stackTrace){
      if(kDebugMode){
        print(error.toString());
      }
    });
  } 
}