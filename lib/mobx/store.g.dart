// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ToDoStore on _ToDoStore, Store {
  late final _$doneAtom = Atom(name: '_ToDoStore.done', context: context);

  @override
  bool get done {
    _$doneAtom.reportRead();
    return super.done;
  }

  @override
  set done(bool value) {
    _$doneAtom.reportWrite(value, super.done, () {
      super.done = value;
    });
  }

  late final _$_ToDoStoreActionController =
      ActionController(name: '_ToDoStore', context: context);

  @override
  void toggleDone() {
    final _$actionInfo =
        _$_ToDoStoreActionController.startAction(name: '_ToDoStore.toggleDone');
    try {
      return super.toggleDone();
    } finally {
      _$_ToDoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
done: ${done}
    ''';
  }
}
