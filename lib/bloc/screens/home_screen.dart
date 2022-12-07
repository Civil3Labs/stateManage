import 'dart:developer';

import 'package:flutter/material.dart';

import '../bloc/todo_bloc.dart';
import '../modal/add_todo_modal.dart';
import 'todo_screen.dart';

class BlocPage extends StatefulWidget {
  const BlocPage({super.key});

  final String title = 'Bloc State Manage Page';

  @override
  State<BlocPage> createState() => _BlocPageState();
}

class _BlocPageState extends State<BlocPage> {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  TodoBloc todoBloc = TodoBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CategButton(
              icon: Icons.add,
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) => Container(
                          padding: const EdgeInsets.all(10),
                          height: 400,
                          width: 400,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Form(
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: titleController,
                                      decoration: const InputDecoration(
                                        labelText: 'Title',
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      controller: descController,
                                      decoration: const InputDecoration(
                                        labelText: 'Description',
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    CategButton(
                                      icon: Icons.add,
                                      onTap: () {
                                        todoBloc.addTask(AddTodoModal(
                                            title: titleController.text,
                                            description: descController.text));
                                        print(todoBloc.myList.length);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ));
              },
            ),
            const SizedBox(height: 10),
            CategButton(
              icon: Icons.forward,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ToDoScreen(
                              title: 'ToDo List',
                              object: todoBloc,
                            )));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CategButton extends StatelessWidget {
  const CategButton({Key? key, required this.icon, required this.onTap})
      : super(key: key);
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue[200]),
        elevation: MaterialStateProperty.all(0),
        overlayColor: MaterialStateProperty.all(Colors.blue[400]),
      ),
      onPressed: onTap,
      child: Container(
        width: 100,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.blue[400],
            radius: 30,
            child: SizedBox(
              height: 50,
              width: 50,
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
