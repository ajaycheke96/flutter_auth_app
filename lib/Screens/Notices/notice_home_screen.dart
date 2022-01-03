import 'package:flutter/material.dart';
import 'package:flutter_auth_app/Models/Communication/notice_model.dart';
import 'package:flutter_auth_app/Services/communication_service.dart';
import 'package:flutter_auth_app/constants.dart';

class NoticeHomeScreen extends StatefulWidget {
  const NoticeHomeScreen({Key? key}) : super(key: key);

  @override
  _NoticeHomeScreenState createState() => _NoticeHomeScreenState();
}

class _NoticeHomeScreenState extends State<NoticeHomeScreen> {
  final CommunicationService _communicationService = CommunicationService();
  List<NoticeModel> _mapList = [];

  @override
  void initState() {
    super.initState();

    _fetchNoticeRecord();
  }

  void _fetchNoticeRecord() {
    _communicationService.fetchAllNoticeForUser().then((value) {
      setState(() {
        _mapList = value;
      });

      _mapList.forEach((element) {
        print(element.title.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("All Notices"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _mapList.length,
          itemBuilder: (_, index) {
            return Container(
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
                    "Title : ${_mapList.elementAt(index).title!.toUpperCase()}",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Text(
                    "To : ${_mapList.elementAt(index).targetRoles}",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black38),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    child: Container(
                      child: Text(
                        "Description : ${_mapList.elementAt(index).description}",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Created At : ${_mapList.elementAt(index).createdAt}",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black38),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
