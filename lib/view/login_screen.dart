import 'package:flutter/material.dart';
import 'package:mvvm_archi/utils/routes/route_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouteName.home);
              },
              child: const Text(
                "Tap Here!!",
              ),
            ),
          )
        ],
      ),
    );
  }
}
