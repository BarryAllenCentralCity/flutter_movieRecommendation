import 'package:flutter/material.dart';
import 'package:flutter16_movierec/Core/constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.onPressed, required this.text, required this.width}) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 12.0),
    child: TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(),
        fixedSize: Size(width, 48.0),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text,
          style: Theme.of(context).textTheme.button,
          )
        ],
      ),
    ),
    );
  }
}
