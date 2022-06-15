import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'list_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool('isLogin') ?? false;
    print("=-=-=- isLogin : $isLogin");

    return isLogin;
  }

  moveScreen() async {
    await checkLogin().then((isLogin) => {
          if (isLogin)
            {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ListScreen()))
            }
          else
            {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginScreen()))
            }
        });
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      moveScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'SplashScreen',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'TODO list app!!',
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
