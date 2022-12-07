import 'package:mobx/mobx.dart';

import 'store.dart';
part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {
  @observable
  ObservableList<ToDoStore> toDoList = ObservableList<ToDoStore>();

  @action
  void addToDo(String title) {
    toDoList.insert(0, ToDoStore(title));
  }
}
