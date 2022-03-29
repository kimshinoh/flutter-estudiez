// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoList on _TodoListBase, Store {
  Computed<ObservableList<Todo>>? _$pendingTodosComputed;

  @override
  ObservableList<Todo> get pendingTodos => (_$pendingTodosComputed ??=
          Computed<ObservableList<Todo>>(() => super.pendingTodos,
              name: '_TodoListBase.pendingTodos'))
      .value;
  Computed<ObservableList<Todo>>? _$completedTodosComputed;

  @override
  ObservableList<Todo> get completedTodos => (_$completedTodosComputed ??=
          Computed<ObservableList<Todo>>(() => super.completedTodos,
              name: '_TodoListBase.completedTodos'))
      .value;
  Computed<ObservableList<Todo>>? _$visibleTodosComputed;

  @override
  ObservableList<Todo> get visibleTodos => (_$visibleTodosComputed ??=
          Computed<ObservableList<Todo>>(() => super.visibleTodos,
              name: '_TodoListBase.visibleTodos'))
      .value;

  final _$todosAtom = Atom(name: '_TodoListBase.todos');

  @override
  ObservableList<Todo> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(ObservableList<Todo> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  final _$activeFilterAtom = Atom(name: '_TodoListBase.activeFilter');

  @override
  VisibilityFilter get activeFilter {
    _$activeFilterAtom.reportRead();
    return super.activeFilter;
  }

  @override
  set activeFilter(VisibilityFilter value) {
    _$activeFilterAtom.reportWrite(value, super.activeFilter, () {
      super.activeFilter = value;
    });
  }

  final _$_TodoListBaseActionController =
      ActionController(name: '_TodoListBase');

  @override
  void setFilter(VisibilityFilter filter) {
    final _$actionInfo = _$_TodoListBaseActionController.startAction(
        name: '_TodoListBase.setFilter');
    try {
      return super.setFilter(filter);
    } finally {
      _$_TodoListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTodo(Todo todo) {
    final _$actionInfo = _$_TodoListBaseActionController.startAction(
        name: '_TodoListBase.addTodo');
    try {
      return super.addTodo(todo);
    } finally {
      _$_TodoListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTodo(Todo todo) {
    final _$actionInfo = _$_TodoListBaseActionController.startAction(
        name: '_TodoListBase.removeTodo');
    try {
      return super.removeTodo(todo);
    } finally {
      _$_TodoListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todos: ${todos},
activeFilter: ${activeFilter},
pendingTodos: ${pendingTodos},
completedTodos: ${completedTodos},
visibleTodos: ${visibleTodos}
    ''';
  }
}
