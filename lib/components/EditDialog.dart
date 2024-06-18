import "package:first_app/components/Button.dart";
import "package:flutter/material.dart";

class EditDialog extends StatelessWidget {
  final editController;
  final VoidCallback onEdit;
  final VoidCallback onCancel;

  const EditDialog(
      {super.key,
      required this.editController,
      required this.onCancel,
      required this.onEdit});

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
                controller: editController,
                decoration: const InputDecoration(
                  hintText: "Edit task",
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
                    btnName: "EDIT",
                    onPressed: onEdit,
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
