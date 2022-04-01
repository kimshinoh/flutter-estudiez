import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/models/todo/todo.dart';
import 'package:fruity/stores/todo/todo_store.dart';
import 'package:fruity/utils/datetime_utils.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TodoList todoStore = TodoList();

  final TextEditingController _textEditingController = TextEditingController();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    todoStore.listTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TodoList')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _inputAddTodo(),
            _filterTodo(),
            _listTodo(),
          ],
        ),
      ),
    );
  }

  Widget _filterTodo() {
    return Observer(builder: (_) {
      return Column(
        children: [
          ListTile(
            title: const Text('All'),
            leading: Radio(
                value: VisibilityFilter.all,
                groupValue: todoStore.activeFilter,
                onChanged: (_) {
                  todoStore.setFilter(VisibilityFilter.all);
                },),
          ),
          ListTile(
            title: const Text('Completed'),
            leading: Radio(
                value: VisibilityFilter.completed,
                groupValue: todoStore.activeFilter,
                onChanged: (_) {
                  todoStore.setFilter(VisibilityFilter.completed);
                },),
          ),
          ListTile(
            title: const Text('Pending'),
            leading: Radio(
                value: VisibilityFilter.pending,
                groupValue: todoStore.activeFilter,
                onChanged: (_) {
                  todoStore.setFilter(VisibilityFilter.pending);
                },),
          ),
        ],
      );
    },);
  }

  Widget _inputAddTodo() {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Enter your todo',
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
      ),
      controller: _textEditingController,
      textInputAction: TextInputAction.done,
      onSubmitted: (String? value) {
        if (value != null) {
          final String id = Random().nextInt(1000).toString();
          final Todo newTodo = Todo(value);
          todoStore.addTodo(newTodo);
          _textEditingController.clear();
        }
      },
    );
  }

  Widget _listTodo() {
    return Observer(builder: (BuildContext context) {
      return Column(
        children: [
          ...todoStore.todos.map((Todo todo) {
            return Observer(builder: (_) {
              return ListTile(
                leading: Checkbox(
                  value: todo.completed,
                  onChanged: (_) {
                    todo.completed = !todo.completed;
                  },
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    todoStore.removeTodo(todo);
                  },
                ),
                title: Text(todo.title),
                subtitle: Text(DateTimeHelper.formatDate(
                    todo.createdAt, 'dd/MM/yyyy HH:ss',),),
              );
            },);
          })
        ],
      );
    },);
  }
}
