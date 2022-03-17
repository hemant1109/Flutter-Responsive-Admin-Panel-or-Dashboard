import 'package:admin/controllers/MenuController.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class LoginScreenStateFull extends StatefulWidget {
  const LoginScreenStateFull({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreenStateFull> {
  @override
  Widget build(BuildContext context) {
    return _loginScreenState();
  }

  final _formKey = GlobalKey<FormState>();

  Widget _loginScreenState() {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      body: Center(
        heightFactor: 0.8,
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 80.0, bottom: 50),
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter valid email id as abc@gmail.com',
                      ),
                      validator: (value) {
                        return _validateEmail(value);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    //padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter secure password',
                      ),
                      validator: (value) {
                        return _validatePassword(value);
                      },
                    ),
                  ),
                  SizedBox(
                    height: defaultPadding * 2,
                  ),
                  MaterialButton(
                    onPressed: () {
                      //TODO FORGOT PASSWORD SCREEN GOES HERE
                      if (kDebugMode) {
                        print("FORGOT PASSWORD SCREEN");
                      }
                      _showSnackBar(
                          context: context, text: "FORGOT PASSWORD SCREEN");
                    },
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: defaultPadding * 2),
                      child: Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: MaterialButton(
                          onPressed: () {
                            // if (!_formKey.currentState!.validate()) {
                            //   return;
                            // }
                            _showSnackBar(
                                context: context, text: "Login in...");
                            Future.delayed(const Duration(milliseconds: 1500),
                                () {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => MainScreen()));
                            });
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextButton(
                    onPressed: () {
                      _showSnackBar(
                          context: context, text: "New User Create Account");
                    },
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: const Text(
                        'New User? Create Account',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? _validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Enter password";
    } else {
      return null;
    }
  }

  bool emailValidation(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
  }

  String? _validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Enter email";
    } else if (!emailValidation(email)) {
      return "Enter valid email";
    } else {
      return null;
    }
  }

  void _showSnackBar(
      {required BuildContext context,
      required String text,
      String? actionLabel,
      VoidCallback? callback}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      action: (actionLabel != null && callback != null)
          ? SnackBarAction(
              label: actionLabel,
              onPressed: callback,
            )
          : null,
    ));
  }
}
