import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'icon_button.dart';
import 'list_store.dart';
import 'store.dart';
import 'text_field.dart';

class MobxPage extends StatefulWidget {
  const MobxPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MobxPageState createState() => _MobxPageState();
}

class _MobxPageState extends State<MobxPage> {
  ListStore listStore = ListStore();
  final TextEditingController controller = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // ignore: prefer_const_constructors
                    Text(
                      'Tarefas',
                      style: const TextStyle(
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.w900,
                          fontSize: 32),
                    ),
                    IconButton(
                      icon: const Icon(Icons.exit_to_app),
                      color: Colors.lightBlue,
                      onPressed: () {
                        listStore.addToDo('11');
                        print('11');
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Observer(builder: (_) {
                          return CustomTextField(
                            controller: controller,
                            hint: 'What needs to be done?',
                            onSubmitted: (value) {
                              listStore.addToDo(value);
                              controller.clear();
                            },
                            enabled: true,
                            prefix: null,
                            suffix: null,
                            textInputType: null,
                          );
                        }),
                        const SizedBox(height: 8),
                        Expanded(
                          child: Observer(builder: (_) {
                            return ListView.separated(
                              itemCount: listStore.toDoList.length,
                              itemBuilder: (_, index) {
                                final toDo = listStore.toDoList[index];
                                return Observer(
                                  builder: (_) {
                                    return ListTile(
                                      title: Text(
                                        toDo.title,
                                        style: TextStyle(
                                            decoration: toDo.done
                                                ? TextDecoration.lineThrough
                                                : null,
                                            color: toDo.done
                                                ? Theme.of(context).primaryColor
                                                : Colors.teal[900]),
                                      ),
                                      onTap: toDo.toggleDone,
                                    );
                                  },
                                );
                              },
                              separatorBuilder: (_, __) {
                                return const Divider();
                              },
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
