import 'dart:async';

import 'package:demo/app_shoppingmall/models/model_auth.dart';
import 'package:demo/app_todolist/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> checkLogin() async {
    final authClient = Provider.of<FirebaseAuthProvider>(context, listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isLogin = prefs.getBool('isLogin-shoppingMall') ?? false;
    print('login state : $isLogin');

    if (isLogin) {
      String? email = prefs.getString('email');
      String? password = prefs.getString('password');
      await authClient.loginWithEmail(email!, password!).then((loginStatus) => {
            if (loginStatus == AuthStatus.loginSuccess)
              {print("login success")}
            else
              {print("login failed"), isLogin = false, prefs.setBool('isLogin-shoppingMall', false)}
          });
    }

    return isLogin;
  }

  moveScreen() async {
    await checkLogin().then((isLogin) => isLogin
        ? Navigator.of(context).pushReplacementNamed('/index')
        : Navigator.of(context).pushReplacementNamed('/login'));
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1500), () => moveScreen());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange.shade50,
      appBar: null,
      body: const Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
