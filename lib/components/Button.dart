import "package:flutter/material.dart";

class Button extends StatelessWidget {
  final String btnName;
  final VoidCallback onPressed;

  const Button({
    super.key,
    required this.btnName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: btnName == "CANCEL" ? Colors.red : Colors.green,
      textColor: Colors.white,
      padding: const EdgeInsets.all(10),
      elevation: 10,
      child: Text(btnName),
    );
  }
}
