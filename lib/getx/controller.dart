import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'model.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  @override
  void onInit() {
    List? storedTodos = GetStorage().read<List>('todos');
    if (!(storedTodos == null)) {
      todos = storedTodos.map((e) => Todo.fromJson(e)).toList().obs;
    } else {
      todos = <Todo>[Todo(text: '11')].obs;
    }
    ever(todos, (_) {
      GetStorage().write('todos', todos.toList());
    });
    super.onInit();
  }
}
