import "package:flutter/material.dart";

// ignore: must_be_immutable
class TodoTile extends StatefulWidget {
  final String taskName;
  bool taskCompleted;
  Function(bool?)? onChanged;
  VoidCallback deleteTask;
  VoidCallback editTask;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteTask,
    required this.editTask,
  });

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(children: [
        Checkbox(value: widget.taskCompleted, onChanged: widget.onChanged),
        Text(
          widget.taskName,
          style: TextStyle(
            decoration: widget.taskCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            fontSize: 18,
          ),
        ),
        GestureDetector(
          onTap: widget.deleteTask,
          child: const Icon(Icons.delete_outline_outlined),
        ),
        GestureDetector(
          onTap: widget.editTask,
          child: const Icon(Icons.edit),
        )
      ]),
    );
  }
}
