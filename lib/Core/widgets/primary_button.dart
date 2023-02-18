import 'package:flutter/material.dart';
import 'package:flutter16_movierec/Core/constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.onPressed, required this.text,this.isLoading = false ,this.width}) : super(key: key);

  final VoidCallback onPressed;
  final bool isLoading;
  final String text;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 12.0),
    child: TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(),
        fixedSize: Size(width?? double.infinity , 48.0),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            if (isLoading)
              CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onPrimary,
              )
            else
              Text(
                text,
                style: Theme.of(context).textTheme.button,
              ),
          ],
      ),
    ),
    );
  }
}
