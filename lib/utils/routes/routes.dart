import 'package:flutter/material.dart';
import 'package:mvvm_archi/utils/routes/route_name.dart';
import 'package:mvvm_archi/view/home_screen.dart';
import 'package:mvvm_archi/view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name) {
      case RouteName.home : 
        return MaterialPageRoute(builder: (_) => const HomeScreen(),);

      case RouteName.login : 
        return MaterialPageRoute(builder: (_) => const LoginScreen(),);

      default:
        return MaterialPageRoute(builder: (_) {
          return const  Scaffold(
            body: Center(
              child: Text("NO ROUTE FIND"),
            ),
          );
        },);
    }
  }
}