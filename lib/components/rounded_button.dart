import 'package:flutter/material.dart';
import 'package:flutter_auth_app/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final press;
  final Color color, textColor;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This size provide us total heighhht and width of our screen
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: color,
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 40,
            ),
          ),
          // style: ButtonStyle(
          //   backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          //     (Set<MaterialState> states) {
          //       if (states.contains(MaterialState.pressed))
          //         return Theme.of(context).colorScheme.primary.withOpacity(0.5);
          //       return color; // Use the component's default.
          //     },
          //   ),
          //   mouseCursor:
          // ),
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
