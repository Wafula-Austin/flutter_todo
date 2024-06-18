import "package:first_app/components/DialogBox.dart";
import "package:first_app/components/EditDialog.dart";
import "package:first_app/components/TodoTile.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final myController = TextEditingController();
  final editTaskController = TextEditingController();

  List todoList = [
    ["Make tutorial", false],
    ["Cutt grass", true],
    ["Have lunch", false],
    ["Cook ", true],
    ["Buy groceries", false]
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      todoList.add([myController.text, false]);
      myController.clear();
      Navigator.of(context).pop();
    });
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          textController: myController,
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask,
        );
      },
    );
  }

  void saveEditedTask(int index) {
    setState(() {
      todoList[index][0] = editTaskController.text;
      Navigator.of(context).pop();
      editTaskController.clear();
    });
  }

  void editTask(ind) {
    showDialog(
        context: context,
        builder: (context) {
          return EditDialog(
            editController: editTaskController,
            onCancel: () => Navigator.of(context).pop(),
            onEdit: () {
              saveEditedTask(ind);
            },
          );
        });
  }

  void removeTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 133, 231, 136),
      appBar: AppBar(
        title: const Center(
          child: Text(
            "TODO LIST",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 7, 180, 12),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(82, 0, 150, 135),
        elevation: 15,
        onPressed: createNewTask,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(25),
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
              editTask: () {
                editTask(index);
              },
              deleteTask: () {
                removeTask(index);
              },
              taskName: todoList[index][0],
              taskCompleted: todoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index));
        },
      ),
    );
  }
}
