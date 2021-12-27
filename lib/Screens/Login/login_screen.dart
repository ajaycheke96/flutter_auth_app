import 'package:flutter/material.dart';
import 'package:flutter_auth_app/Screens/Dashboard/student_dashboard.dart';
import 'package:flutter_auth_app/Screens/Login/components/body.dart';
import 'package:flutter_auth_app/Services/auth_service.dart';
import 'package:flutter_auth_app/Utils/http_utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

// class LoginScreen2 extends StatefulWidget {
//   const LoginScreen2({Key? key}) : super(key: key);

//   @override
//   _LoginScreen2State createState() => _LoginScreen2State();
// }

// class _LoginScreen2State extends State<LoginScreen2> {
//   // form key
//   final _formKey = GlobalKey<FormState>();

//   // editing controller
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     // email field
//     final emailField = TextFormField(
//       autofocus: false,
//       controller: emailController,
//       keyboardType: TextInputType.emailAddress,
//       validator: (value) {
//         if (value!.isEmpty) {
//           return "Please enter your email";
//         }

//         // reg expression for email validation
//         if (!RegExp("^[a-zA-Z0-9+_.-]+![a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
//           return "Please enter a valid email";
//         }

//         return null;
//       },
//       onSaved: (newValue) {
//         emailController.text = newValue!;
//       },
//       textInputAction: TextInputAction.next,
//       decoration: const InputDecoration(
//         icon: Icon(Icons.mail),
//         contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//         hintText: "Email",
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(10),
//           ),
//         ),
//       ),
//     );

//     // password field
//     final passwordField = TextFormField(
//       autofocus: false,
//       controller: passwordController,
//       obscureText: true,
//       validator: (value) {
//         RegExp regExp = RegExp(r'^.{6,}$');
//         if (value!.isEmpty) {
//           return "Please enter your password";
//         }
//         if (!regExp.hasMatch(value)) {
//           return "Please enter valid password(Min. 6 charactor)";
//         }
//       },
//       onSaved: (newValue) {
//         passwordController.text = newValue!;
//       },
//       textInputAction: TextInputAction.done,
//       decoration: const InputDecoration(
//         icon: Icon(Icons.vpn_key),
//         contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//         hintText: "Password",
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(10),
//           ),
//         ),
//       ),
//     );

//     final loginButton = ElevatedButton(
//       onPressed: () {
//         signIn(
//           emailController.text,
//           passwordController.text,
//         );
//       },
//       child: Text("Login"),
//     );

//     return Container(
//       // child: Form(
//       //     key: _formKey,
//       child: Column(
//         children: [
//           emailField,
//           passwordField,
//           loginButton,
//         ],
//       ),
//       // ),
//     );
//   }

//   void signIn(String email, String password) async {
//     if (_formKey.currentState!.validate()) {
//       print(email);
//       print(password);
//       // AuthService()
//       //     .login(email, password)
//       //     .then((value) => {
//       //           AlertDialog(title: Text("Login successfully")),
//       //           Navigator.of(context).pushReplacement(
//       //             MaterialPageRoute(
//       //               builder: (context) => StudentDashboard(),
//       //             ),
//       //           ),
//       //         })
//       //     .catchError((e) => {
//       //           AlertDialog(
//       //             title: Text("Authentication failed"),
//       //           )
//       //         });
//     }
//   }
// }
