import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth_app/Screens/Dashboard/components/logout_button.dart';
import 'package:flutter_auth_app/Screens/Login/login_screen.dart';
import 'package:flutter_auth_app/Screens/UserProfile/employee_user_profile.dart';
import 'package:flutter_auth_app/Services/auth_service.dart';
import 'package:flutter_auth_app/constants.dart';

class EmployeeDashboard extends StatefulWidget {
  const EmployeeDashboard({Key? key}) : super(key: key);

  @override
  _EmployeeDashboardState createState() => _EmployeeDashboardState();
}

class _EmployeeDashboardState extends State<EmployeeDashboard> {
  final String routeName = '/student-dashboard';

  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    Center(
      child: Text(
        "Home / Dashboard page",
        style: TextStyle(fontSize: 24),
      ),
    ),
    Center(
      child: Text(
        "Activity Page",
        style: TextStyle(fontSize: 24),
      ),
    ),
    Center(
      child: Text(
        "Add Page",
        style: TextStyle(fontSize: 24),
      ),
    ),
    Center(
      child: Text(
        "Contact Page",
        style: TextStyle(fontSize: 24),
      ),
    ),
    Center(
      child: Text(
        "Community page",
        style: TextStyle(fontSize: 24),
      ),
    ),
    EmployeeUserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee Dashboard"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.comment),
            tooltip: 'Comment Icon',
            onPressed: () {},
          ), //IconButton
          IconButton(
            icon: Icon(Icons.settings),
            tooltip: 'Setting Icon',
            onPressed: () {
              AuthService().removeAllLoginRecords();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (_) => false,
              );
            },
          ), //IconButton
        ], //<Widget>[]
        backgroundColor: Colors.blueAccent[400],
        elevation: 50.0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Menu Icon',
          onPressed: () {},
        ), //IconButton
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: // BottomWidgetBar(),
          BottomNavigationBar(
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: kAccentBtn,
            ),
            label: 'HOME',
            activeIcon: Icon(
              Icons.home,
              color: kAccentActiveBtn,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.rule_outlined,
              color: kAccentBtn,
            ),
            label: 'ACTIVITY',
            activeIcon: Icon(
              Icons.rule_folder_rounded,
              color: kAccentActiveBtn,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline,
              color: kAccentBtn,
              size: 36,
            ),
            label: 'ADD',
            activeIcon: Icon(
              Icons.add_circle,
              color: kAccentActiveBtn,
              size: 36,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.import_contacts,
              color: kAccentBtn,
              size: 36,
            ),
            label: 'CONTACT',
            activeIcon: Icon(
              Icons.import_contacts_rounded,
              color: kAccentActiveBtn,
              size: 36,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.campaign_outlined,
              color: kAccentBtn,
              size: 36,
            ),
            label: 'Community',
            activeIcon: Icon(
              Icons.campaign_rounded,
              color: kAccentActiveBtn,
              size: 36,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              color: kAccentBtn,
              size: 36,
            ),
            label: 'User Profile',
            activeIcon: Icon(
              Icons.person,
              color: kAccentActiveBtn,
              size: 36,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
