import 'package:flutter/material.dart';

const iconSize = 80.0;
const iconTextFontSize = 18.0;
const iconTextFontColor = Color(0xFF8D8E98);

class IconContent extends StatelessWidget {
  final IconData faIcon;
  final String iconText;

  IconContent({@required this.faIcon, @required this.iconText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          this.faIcon,
          size: iconSize,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          this.iconText,
          style: TextStyle(
            fontSize: iconTextFontSize,
            color: iconTextFontColor,
          ),
        ),
      ],
    );
  }
}