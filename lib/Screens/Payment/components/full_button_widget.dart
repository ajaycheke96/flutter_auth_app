import 'package:flutter/material.dart';

class CustomWidgetButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final String text;
  final Function()? onTop;
  final bool? isBorder;
  const CustomWidgetButton({
    Key? key,
    this.backgroundColor = Colors.black,
    this.textColor,
    this.onTop,
    this.isBorder = false,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Pressed");
      },
      child: Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        height: 60,
        width: MediaQuery.of(context).size.width - 60,
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: Colors.black)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
