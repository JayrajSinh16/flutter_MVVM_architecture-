import 'package:flutter/material.dart';
import 'package:mvvm_archi/resources/components/round_button.dart';
import 'package:mvvm_archi/utils/routes/route_name.dart';
import 'package:mvvm_archi/utils/utils.dart';
import 'package:provider/provider.dart';

import '../view_model/auth_view_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  
  final TextEditingController _editingController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  final ValueNotifier<bool> _toggle = ValueNotifier<bool>(true);

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _editingController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp Screen"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              focusNode: emailFocusNode,
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                  context,
                  emailFocusNode,
                  passwordFocusNode,
                );
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Enter Email",
                labelText: "Email",
                prefixIcon: Icon(
                  Icons.alternate_email,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ValueListenableBuilder(
              valueListenable: _toggle,
              builder: (context, value, child) {
                return TextFormField(
                  obscureText: _toggle.value,
                  obscuringCharacter: "😁",
                  focusNode: passwordFocusNode,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        _toggle.value = !_toggle.value;
                      },
                      child: _toggle.value
                          ? const Icon(Icons.visibility_off_rounded)
                          : const Icon(Icons.visibility_rounded),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
            RoundButton(
              title: "SignUp",
              loading: authViewModel.signUpLoading,
              onPress: () {
                if (_editingController.text.isEmpty) {
                  Utils.flushBarErrorMessage("PLease Enter Email", context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage("PLease Enter Password", context);
                } else if (_passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage("Too short Password", context);
                } else {

                  Map data = {
                    'email': "eve.holt@reqres.in",
                    'password': "pistol",
                  };

                  // Map data = {
                  //   'email': _editingController.text.toString(),
                  //   'password': _passwordController.text.toString(),
                  // };
                  
                  authViewModel.signUpApi(data, context);
                  Utils.flushBarErrorMessage("Hit API", context);
                }
              },
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouteName.login);
              },
              child: const Text("Already Have an Accout ? Login"),
            )
          ],
        ),
      ),
    );
  }
}