import 'package:demo/app_shoppingmall/components/button_confirm.dart';
import 'package:demo/app_shoppingmall/components/button_text.dart';
import 'package:demo/app_shoppingmall/components/input_email.dart';
import 'package:demo/app_shoppingmall/components/input_password.dart';
import 'package:demo/app_shoppingmall/models/model_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/provider_auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginFieldModel(),
      builder: (context, child) {
        return GestureDetector(
          // enable to dismiss a soft keyboard when users tap outside of input field widgets
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
              appBar: AppBar(
                title: const Text('Login'),
              ),
              body: Column(
                children: [
                  EmailInput((x) => {Provider.of<LoginFieldModel>(context, listen: false).setEmail(x)}),
                  PasswordInput((x) => {Provider.of<LoginFieldModel>(context, listen: false).setPassword(x)}),
                  ConfirmButton('Login', () async {
                    final authClient = Provider.of<FirebaseAuthProvider>(context, listen: false);
                    final registerField = Provider.of<LoginFieldModel>(context, listen: false);

                    await authClient.loginWithEmail(registerField.email, registerField.password).then((loginStatus) => {
                          if (loginStatus == AuthStatus.loginSuccess)
                            {
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(SnackBar(content: Text('welcome, ${authClient.user!.email}'))),
                              Navigator.pushReplacementNamed(context, '/index')
                            }
                          else
                            {
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(const SnackBar(content: Text('login failed. Please try again'))),
                            }
                        });
                  }),
                  const Padding(padding: EdgeInsets.all(8.0), child: Divider(thickness: 1)),
                  SimpleTextButton('Register with email', () {
                    Navigator.of(context).pushNamed('/register');
                  })
                ],
              )),
        );
      },
    );
  }
}
