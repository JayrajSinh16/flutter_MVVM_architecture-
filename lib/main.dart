import 'package:flutter/material.dart';
import 'package:mvvm_archi/utils/routes/route_name.dart';
import 'package:mvvm_archi/utils/routes/routes.dart';
import 'package:mvvm_archi/view/login_screen.dart';
import 'package:mvvm_archi/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(
        create: (context) => AuthViewModel(),
      ),
    ],
    child: MaterialApp(
      title: 'IRON MAN',
      initialRoute: RouteName.login,
      onGenerateRoute: Routes.generateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    ),
    );
  }
}
