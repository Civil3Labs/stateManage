import 'dart:async';

import '../modal/add_todo_modal.dart';

class TodoBloc {
  List<AddTodoModal> myList = [];

  final _getListOfTask = StreamController<List<AddTodoModal>>();
  StreamSink<List<AddTodoModal>> get getSink => _getListOfTask.sink;
  Stream<List<AddTodoModal>> get getStream => _getListOfTask.stream;

  addTask(data) {
    myList.add(data);
    getSink.add(myList);
  }

  deleteTask(index) {
    myList.removeAt(index);
    getSink.add(myList);
  }

  List<int> myData = [];
  Stream<List<int>> myReport() async* {
    for (int i = 0; i <= 10; i++) {
      myData.add(i);
      await Future.delayed(const Duration(seconds: 2));
      yield myData;
    }
  }
}
