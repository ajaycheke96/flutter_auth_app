import 'package:flutter/material.dart';
import 'package:flutter_auth_app/Models/Communication/notice_model.dart';
import 'package:flutter_auth_app/Screens/Notices/notice_home_screen.dart';
import 'package:flutter_auth_app/Services/communication_service.dart';

class NoticeDashboard extends StatefulWidget {
  NoticeDashboard({Key? key}) : super(key: key);

  @override
  State<NoticeDashboard> createState() => _NoticeDashboardState();
}

class _NoticeDashboardState extends State<NoticeDashboard> {
  final CommunicationService _communicationService = CommunicationService();
  NoticeModel notice = NoticeModel();
  @override
  void initState() {
    super.initState();
    _fetchNoticeRecord();
  }

  void _fetchNoticeRecord() {
    _communicationService.fetchAllNoticeForUser().then((value) {
      setState(() {
        if (value.isNotEmpty) {
          notice = value.first;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        print("Show All notices");
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => NoticeHomeScreen()));
      },
      child: Container(
        width: size.width - 20,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Title : ${notice.title != null ? notice.title!.toUpperCase() : 'No titile'}",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            Text(
              "To : ${notice.targetRoles ?? 'No Role'}",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black38),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              child: Container(
                child: Text(
                  "Description : ${notice.description ?? 'No Description'}",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Created At : ${notice.createdAt ?? '--'}",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black38),
            ),
          ],
        ),
      ),
    );
  }
}
