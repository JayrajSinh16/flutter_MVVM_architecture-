import 'package:flutter/material.dart';
import 'package:mvvm_archi/view_model/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splashServices = SplashServices();

  @override
  void initState(){
    super.initState();
    splashServices.checkAuth(context);
  }


  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      body: Column(
        children: [
          Center(
            child: Text("MVVM ARCHITECTURE\n With Rest API\n Provider State-Management"),
          )
        ],
      ),
    );
  }
}