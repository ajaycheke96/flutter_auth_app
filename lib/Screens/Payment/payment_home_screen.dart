import 'package:flutter/material.dart';
import 'package:flutter_auth_app/Screens/Payment/components/full_button_widget.dart';
import 'package:flutter_auth_app/Screens/Payment/components/sized_text.dart';
import 'package:flutter_auth_app/constants.dart';

class PaymentHomeScreen extends StatefulWidget {
  const PaymentHomeScreen({Key? key}) : super(key: key);

  @override
  _PaymentHomeScreenState createState() => _PaymentHomeScreenState();
}

class _PaymentHomeScreenState extends State<PaymentHomeScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Container(
        height: h,
        child: Stack(
          children: [_headSection(), _listReceipts(), _payButton()],
        ),
      ),
    );
  }

  _headSection() {
    return Container(
      height: 300,
      // color: kPrimaryColor,
      child: Stack(
        children: [
          _mainBackground(),
          // _curveImageContainer(),
        ],
      ),
    );
  }

  _mainBackground() {
    return Positioned(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/images/main_top.png",
            ),
          ),
        ),
      ),
    );
  }

  // Positioned _curveImageContainer() => Positioned(
  //       child: Container(
  //         decoration: BoxDecoration(
  //           image: DecorationImage(
  //             fit: BoxFit.cover,
  //             image: AssetImage(
  //               "assets/images/main_top.png",
  //             ),
  //           ),
  //         ),
  //       ),
  //     );

  _listReceipts() {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      top: 320,
      left: 0,
      right: 0,
      bottom: 0,
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (_, index) {
              return SingleChildScrollView(
                child: Container(
                    margin: EdgeInsets.only(top: 20, right: 20),
                    height: 130,
                    width: size.width - 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFd8dbe0),
                          offset: Offset(1, 1),
                          blurRadius: 20.0,
                          spreadRadius: 10,
                        )
                      ],
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, left: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          width: 3,
                                          color: Colors.grey,
                                        ),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "assets/images/main_top.png"))),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Invoice Number ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "ID:12345678",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedText(
                                  text:
                                      "Auto pay on ${DateTime.now().toString().substring(0, 10)}",
                                  color: Colors.green.shade500),
                              SizedBox(height: 5),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.grey,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "SELECT",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black12),
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  Text(
                                    "Rs. 1220",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    "Due Date id ${DateTime.now().toString().substring(0, 10)}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(height: 10)
                                ],
                              ),
                              SizedBox(width: 5),
                              Container(
                                width: 5,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
              );
            }),
      ),
    );
  }

  _payButton() {
    return Positioned(
        bottom: 10,
        child: CustomWidgetButton(
          text: "Pay",
          textColor: Colors.white,
        ));
  }
}
