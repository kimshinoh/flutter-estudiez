import 'package:fruity/models/todo/todo.dart';
import 'package:mobx/mobx.dart';
part 'todo_store.g.dart';

class TodoList = _TodoListBase with _$TodoList;
enum VisibilityFilter { all, pending, completed }

abstract class _TodoListBase with Store {
  @observable
  ObservableList<Todo> todos = ObservableList<Todo>();

  @observable
  VisibilityFilter activeFilter = VisibilityFilter.all;

  @action
  void setFilter(VisibilityFilter filter) {
    activeFilter = filter;
  }

  @action
  void addTodo(Todo todo) {
    todos.add(todo);
  }

  @action
  void removeTodo(Todo todo) {
    todos.remove(todo);
  }

  @computed
  ObservableList<Todo> get pendingTodos {
    return ObservableList.of(todos.where((Todo todo) => !todo.completed));
  }

  @computed
  ObservableList<Todo> get completedTodos {
    return ObservableList.of(todos.where((todo) => todo.completed));
  }

  @computed
  ObservableList<Todo> get visibleTodos {
    if (activeFilter == VisibilityFilter.all) {
      return todos;
    }
    if (activeFilter == VisibilityFilter.completed) {
      return completedTodos;
    }
    return pendingTodos;
  }
}
