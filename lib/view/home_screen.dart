import 'package:flutter/material.dart';
import 'package:mvvm_archi/utils/routes/route_name.dart';
import 'package:mvvm_archi/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: InkWell(
              onTap: () {
                userPreferences.remove().then((value) {
                  Navigator.popAndPushNamed(context, RouteName.login);
                });
              },
              child: const Text("LogOut"),
            ),
          )
        ],
      ),
    );
  }
}
