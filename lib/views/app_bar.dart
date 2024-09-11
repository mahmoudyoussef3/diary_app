import 'package:flutter/material.dart';

import 'notes_view.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconData iconData;
  final void Function()? onPressed;
  final TextStyle textStyle;
  const CustomAppBar({super.key, required this.title, required this.iconData, this.onPressed, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style:  textStyle,
        ),
      ],
    );
  }
}
