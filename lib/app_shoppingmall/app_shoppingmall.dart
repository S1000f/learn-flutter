import 'package:demo/app_shoppingmall/providers/provider_auth.dart';
import 'package:demo/app_shoppingmall/providers/provider_item.dart';
import 'package:demo/app_shoppingmall/screens/screen_index.dart';
import 'package:demo/app_shoppingmall/screens/screen_register.dart';
import 'package:demo/app_shoppingmall/screens/screen_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/screen_detail.dart';
import 'screens/screen_login.dart';
import 'screens/screen_splash.dart';

class AppShoppingMall extends StatelessWidget {
  const AppShoppingMall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FirebaseAuthProvider()),
        ChangeNotifierProvider(create: (context) => ItemProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Shopping Mall Demo',
        routes: {
          '/': (context) => const SplashScreen(),
          '/login': (context) => const LoginScreen(),
          '/index': (context) => const IndexScreen(),
          '/register': (context) => const RegisterScreen(),
          '/search': (context) => const SearchScreen(),
          '/detail': (context) => const DetailScreen()
        },
        initialRoute: '/',
      ),
    );
  }
}
