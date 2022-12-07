// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListStore on _ListStore, Store {
  late final _$toDoListAtom =
      Atom(name: '_ListStore.toDoList', context: context);

  @override
  ObservableList<ToDoStore> get toDoList {
    _$toDoListAtom.reportRead();
    return super.toDoList;
  }

  @override
  set toDoList(ObservableList<ToDoStore> value) {
    _$toDoListAtom.reportWrite(value, super.toDoList, () {
      super.toDoList = value;
    });
  }

  late final _$_ListStoreActionController =
      ActionController(name: '_ListStore', context: context);

  @override
  void addToDo(String title) {
    final _$actionInfo =
        _$_ListStoreActionController.startAction(name: '_ListStore.addToDo');
    try {
      return super.addToDo(title);
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
toDoList: ${toDoList}
    ''';
  }
}
