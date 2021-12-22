import 'dart:io';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_auth_app/Screens/Login/login_screen.dart';
import 'package:flutter_auth_app/Services/auth_service.dart';

class HttpUtils {
  static Map<String, String> setHeader(String token, String tenantName) {
    Map<String, String> header = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: token.isEmpty ? token : '',
      "X-Tenant": tenantName.isEmpty ? tenantName : ''
    };
    print(header);
    return header;
  }

  static void showError(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          content: Text(errorMessage),
          actions: <Widget>[
            new TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void showSuccess(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: Text(message),
          actions: <Widget>[
            new TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  buildLogoutDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          // const DrawerHeader(
          //   decoration: BoxDecoration(
          //     color: Colors.blue,
          //   ),
          //   child: Text(''),
          // ),
          // ListTile(
          //   title: const Text('Item 1'),
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              AuthService().removeAllLoginRecords();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (_) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
