import 'package:demo/app_shoppingmall/components/button_text.dart';
import 'package:demo/app_shoppingmall/models/model_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Profile'),
          SimpleTextButton('Logout', () async {
            var scaffoldMessenger = ScaffoldMessenger.of(context);
            var navigatorState = Navigator.of(context);

            final authClient = Provider.of<FirebaseAuthProvider>(context, listen: false);
            await authClient.logout();

            scaffoldMessenger
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(content: Text('Logout success')));
            navigatorState.pushReplacementNamed('/login');
          })
        ],
      ),
    );
  }
}
