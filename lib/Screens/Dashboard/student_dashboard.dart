import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth_app/Screens/Dues/dues_screen.dart';
import 'package:flutter_auth_app/Screens/Notices/notice_home_screen.dart';
import 'package:flutter_auth_app/Screens/Payment/payment_home_screen.dart';
import 'package:flutter_auth_app/Screens/Students/StudentAttendance/student_attendance_list_screen.dart';
import 'package:flutter_auth_app/Screens/Students/student_attendance_screen.dart';
import 'package:flutter_auth_app/Screens/Timetable/timetable_screen.dart';
import 'package:flutter_auth_app/Screens/UserProfile/user_profile.dart';
import 'package:flutter_auth_app/Utils/http_utils.dart';
import 'package:flutter_auth_app/constants.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({Key? key}) : super(key: key);

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  final String routeName = '/student-dashboard';

  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    Center(
      child: Text(
        "Home / Dashboard page",
        style: TextStyle(fontSize: 24),
      ),
    ),
    PaymentHomeScreen(),
    // Center(
    //   child:
    //       // StudentAttendanceScreen(),
    //       Text(
    //     "Activity Page",
    //     style: TextStyle(fontSize: 24),
    //   ),
    // ),
    Center(
      child: DuesScreen(),
      // Text(
      //   "Add Page",
      //   style: TextStyle(fontSize: 24),
      // ),
    ),
    TimetableScreen(),
    // Center(
    //   child: Text(
    //     "Contact Page",
    //     style: TextStyle(fontSize: 24),
    //   ),
    // ),
    NoticeHomeScreen(),
    // Center(
    //   child: Column(
    //     children: [
    //       Text(
    //         "Community page",
    //         style: TextStyle(fontSize: 24),
    //       ),
    //       ElevatedButton(onPressed: StudentDashboard.gotoNoticePage(), child: Text("Notice Page"))
    //     ],
    //   ),
    // ),
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: kPrimaryColor.withOpacity(.03),
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: Icon(Icons.menu_rounded),
      //     color: kPrimaryColor,
      //     onPressed: () {},
      //   ),
      //   // leading: IconButton(
      //   //   icon: Icon(
      //   //     Icons.arrow_back_ios,
      //   //     color: kPrimaryColor,
      //   //   ),
      //   //   onPressed: () {
      //   //     Navigator.pop(context);
      //   //   },
      //   // ),
      //   // title: Text(
      //   //   "Student Dashboard",
      //   //   style: TextStyle(color: kPrimaryColor),
      //   // ),
      // ),

      appBar: AppBar(
        title: Text("Student Dashboard"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.comment),
            tooltip: 'Comment Icon',
            onPressed: () {},
          ), //IconButton
          IconButton(
            icon: Icon(Icons.settings),
            tooltip: 'Setting Icon',
            onPressed: () {},
          ), //IconButton
        ], //<Widget>[]
        backgroundColor: Colors.blueAccent[400],
        elevation: 50.0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      drawer: HttpUtils().buildLogoutDrawer(context),
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
            // HttpUtils.showSuccess(context, "$index no. Page has been selected!");
          });
        },
      ),
    );
  }

//   Widget _buildBody() {
//   return Container(
//     color: activeTabColor[TabItem.red],
//     alignment: Alignment.center,
//     child: FlatButton(
//       child: Text(
//         'PUSH',
//         style: TextStyle(fontSize: 32.0, color: Colors.white),
//       ),
//       onPressed: _push,
//     )
//   );
// }

// void _push() {
//   Navigator.of(context).push(MaterialPageRoute(
//     // we'll look at ColorDetailPage later
//     builder: (context) => ColorDetailPage(
//       color: activeTabColor[TabItem.red],
//       title: tabName[TabItem.red],
//     ),
//   ));
// }
}
