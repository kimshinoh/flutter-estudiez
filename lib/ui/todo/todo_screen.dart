import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/models/todo/todo.dart';
import 'package:fruity/stores/todo/todo_store.dart';
import 'package:fruity/utils/datetime_utils.dart';
import 'package:mobx/mobx.dart';

class TodoScreen extends StatelessWidget {
  TodoList todoStore = TodoList();

  TodoScreen({Key? key}) : super(key: key);

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TodoList')),
      body: Container(
        child: Column(children: [_inputAddTodo(), _filterTodo(), _listTodo()]),
      ),
    );
  }

  Widget _filterTodo() {
    return Observer(builder: (_) {
      return Column(
        children: [
          ListTile(
            title: Text("All"),
            leading: Radio(
                value: VisibilityFilter.all,
                groupValue: todoStore.activeFilter,
                onChanged: (_) {
                  todoStore.setFilter(VisibilityFilter.all);
                }),
          ),
          ListTile(
            title: Text("Completed"),
            leading: Radio(
                value: VisibilityFilter.completed,
                groupValue: todoStore.activeFilter,
                onChanged: (_) {
                  todoStore.setFilter(VisibilityFilter.completed);
                }),
          ),
          ListTile(
            title: Text("Pending"),
            leading: Radio(
                value: VisibilityFilter.pending,
                groupValue: todoStore.activeFilter,
                onChanged: (_) {
                  todoStore.setFilter(VisibilityFilter.pending);
                }),
          ),
        ],
      );
    });
  }

  Widget _inputAddTodo() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Enter your todo",
      ),
      controller: _textEditingController,
      textInputAction: TextInputAction.done,
      onSubmitted: (String? value) {
        if (value != null) {
          String id = Random().nextInt(1000).toString();
          Todo newTodo = Todo(value);
          todoStore.addTodo(newTodo);
        }
      },
    );
  }

  Widget _listTodo() {
    return Observer(
      builder: (_) {
        return ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            Todo todo = todoStore.visibleTodos[index];
            return Observer(builder: (_) {
              return ListTile(
                leading: Checkbox(
                  value: todo.completed,
                  onChanged: (_) {
                    todo.completed = !todo.completed;
                  },
                ),
                title: Text(todo.title),
                subtitle: Text(DateTimeHelper.formatDate(
                    todo.createdAt, "dd/MM/yyyy HH:ss")),
              );
            });
          },
          itemCount: todoStore.visibleTodos.length,
        );
      },
    );
  }
}
