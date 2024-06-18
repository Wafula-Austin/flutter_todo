import "package:first_app/components/Button.dart";
import "package:flutter/material.dart";

class DialogBox extends StatelessWidget {
  final textController;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox(
      {super.key,
      required this.textController,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 148, 238, 175),
      insetPadding: const EdgeInsets.all(15),
      content: Center(
        child: SizedBox(
          height: 160,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: textController,
                decoration: const InputDecoration(
                  hintText: "Set a task",
                  hintStyle: TextStyle(
                    fontSize: 13,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              Row(
                children: [
                  // Row of buttons
                  Button(btnName: "CANCEL", onPressed: onCancel),
                  const SizedBox(
                    width: 20,
                  ),
                  Button(
                    btnName: "SAVE",
                    onPressed: onSave,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
