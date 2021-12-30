import 'package:flutter/material.dart';
import 'package:flutter_auth_app/Models/Finance/Fee/dues_model.dart';
import 'package:flutter_auth_app/Models/academic_model.dart';
import 'package:flutter_auth_app/Screens/Signup/components/or_divider.dart';
import 'package:flutter_auth_app/Services/academic_service.dart';
import 'package:flutter_auth_app/Services/student_service.dart';
import 'package:flutter_auth_app/constants.dart';

class DuesScreen extends StatefulWidget {
  DuesScreen({Key? key}) : super(key: key);

  @override
  State<DuesScreen> createState() => _DuesScreenState();
}

class _DuesScreenState extends State<DuesScreen> {
  final StudentService _studentService = StudentService();
  final AcademicService _academicService = AcademicService();

  AcademicSessionModel selectedAcademicSession = AcademicSessionModel();

  DueModel dueModel = DueModel();

  @override
  void initState() {
    _fetchAllAcademicSessions();
    super.initState();
  }

  _fetchAllAcademicSessions() {
    _academicService.getDefaultAcademicSession().then((value) {
      // setState(() {
      //   selectedAcademicSession = value;
      // });
      // if (selectedAcademicSession.id != null) {

      _fetchInitRecords(value);
      // }
    });
  }

  _fetchInitRecords(AcademicSessionModel academicSessionModel) {
    print(academicSessionModel.id);
    _studentService.getInvoiceReceiptsByUser(academicSessionModel).then(
      (value) {
        setState(
          () {
            dueModel = value;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Row(
            children: buildDueHeading(
                size,
                dueModel.dueDetails != null
                    ? dueModel.dueDetails!
                    : DueDetailModel()),
          ),
          Divider(
            color: Color(0xFFD9D9D9),
            height: 1.5,
          ),
          SizedBox(
            height: 5,
          ),
          SingleChildScrollView(
            child: Container(
              width: size.width * 0.9,
              child: Column(
                children: [
                  Center(
                      child: Text(
                    "Reciept Details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  )),
                  Column(
                    children: dueModel.invoiceReceipts != null &&
                            dueModel.invoiceReceipts!.length > 0
                        ? dueModel.invoiceReceipts!
                            .map((e) => buildDueInvoice(e))
                            .toList()
                        : [
                            Container(
                              child: Text("No record found!"),
                            ),
                          ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildDueHeading(Size size, DueDetailModel dueDetail) => [
        buildDuesCard(size, "Due", '${dueDetail.amount ?? '0.00'}'),
        buildDuesCard(size, "Deposit", '${dueDetail.paid ?? '0.00'}'),
        buildDuesCard(size, "Due Date",
            '${dueDetail.dueDate != null ? dueDetail.dueDate!.substring(0, 10) : '--'}'),
      ];

  Widget buildDueInvoice(InvoiceReceiptModel invoiceReceipt) => Card(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    "Reciept Id: ${invoiceReceipt.id ?? '--'}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    "Status: ${invoiceReceipt.status ?? '--'}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    "Date: ${invoiceReceipt.date != null ? invoiceReceipt.date!.substring(0, 10) : '--'}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                const Spacer(),
              ],
            ),
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Text(
                  "Description: ${invoiceReceipt.description ?? '--'}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    "Updated At ${invoiceReceipt.updatedAt ?? '--'}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    "Amount : ${invoiceReceipt.amount ?? '--'}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                )
              ],
            )
          ],
        ),
      );

  Widget buildDuesCard(Size size, String title, String value) => Container(
        // margin: EdgeInsets.all(40),
        padding: const EdgeInsets.all(10),
        width: size.width * 0.33,
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  color: kPrimaryColor.withOpacity(0.5), fontSize: 14),
            ),
            Text(
              value,
              style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
}
