import 'package:flutter/material.dart';
import 'package:flutter_auth_app/Screens/Login/login_screen.dart';
import 'package:flutter_auth_app/Services/auth_service.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text("Logout"),
        onPressed: doLogout(context),
      ),
    );
  }

  doLogout(context) {
    AuthService().removeAllLoginRecords();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (_) => false,
    );
  }
}
