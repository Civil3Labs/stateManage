import 'package:demo1/getx/model.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

import 'controller.dart';
import 'todo.dart';

class GetXPage extends StatelessWidget {
  const GetXPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('GetX Todo List'),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            // ignore: avoid_print
            print(todoController.todos);
            todoController.todos.add(Todo(text: ''));
          },
        ),
        body: Obx(() => ListView.separated(
            itemBuilder: (context, index) => Dismissible(
                  key: UniqueKey(),
                  onDismissed: (_) {
                    Todo? removed = todoController.todos[index];
                    todoController.todos.removeAt(index);
                    Get.snackbar('Task removed',
                        'The task "${removed.text}" was successfully removed.',
                        mainButton: TextButton(
                          child: const Text('Undo'),
                          onPressed: () {
                            if (removed == null) {
                              return;
                            }
                            todoController.todos.insert(index, removed!);
                            removed = null;
                            if (Get.isSnackbarOpen) {
                              Get.back();
                            }
                          },
                        ));
                  },
                  child: ListTile(
                    title: Text(todoController.todos[index].text,
                        style: (todoController.todos[index].done)
                            // ignore: prefer_const_constructors
                            ? TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.lineThrough)
                            : TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.color)),
                    onTap: () {
                      Get.to(TodoScreen(
                        index: index,
                      ));
                    },
                    leading: Checkbox(
                      value: todoController.todos[index].done,
                      onChanged: (v) {
                        var changed = todoController.todos[index];
                        changed.done = v!;
                        todoController.todos[index] = changed;
                      },
                    ),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: todoController.todos.length)));
  }
}
