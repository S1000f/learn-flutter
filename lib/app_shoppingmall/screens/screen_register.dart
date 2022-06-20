import 'package:demo/app_shoppingmall/components/button_confirm.dart';
import 'package:demo/app_shoppingmall/components/input_email.dart';
import 'package:demo/app_shoppingmall/components/input_password.dart';
import 'package:demo/app_shoppingmall/providers/provider_auth.dart';
import 'package:demo/app_shoppingmall/models/model_register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterFieldModel(),
      builder: (context, child) {
        return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
                appBar: AppBar(title: const Text('Register')),
                body: Column(
                  children: [
                    EmailInput((email) => Provider.of<RegisterFieldModel>(context, listen: false).setEmail(email)),
                    PasswordInput(
                        (passwd) => Provider.of<RegisterFieldModel>(context, listen: false).setPassword(passwd)),
                    PasswordInput(
                        (passwd) => Provider.of<RegisterFieldModel>(context, listen: false).setPasswordConfirm(passwd),
                        name: 'Password Confirm'),
                    ConfirmButton('Register', () async {
                      final authClient = Provider.of<FirebaseAuthProvider>(context, listen: false);
                      final registerField = Provider.of<RegisterFieldModel>(context, listen: false);

                      if (registerField.password != registerField.passwordConfirm) {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(const SnackBar(content: Text('Please check password you input')));
                        return;
                      }

                      await authClient
                          .registerWithEmail(registerField.email, registerField.password)
                          .then((registerStatus) => {
                                if (registerStatus == AuthStatus.registerSuccess)
                                  {
                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(const SnackBar(content: Text('Register success!'))),
                                    Navigator.pop(context)
                                  }
                                else
                                  {
                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(const SnackBar(content: Text('Register failed'))),
                                  }
                              });
                    })
                  ],
                )));
      },
    );
  }
}
