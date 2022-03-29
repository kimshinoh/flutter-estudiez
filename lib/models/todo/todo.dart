import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo extends _Todo with _$Todo {
  Todo(String title) : super(title) {
    this.createdAt = DateTime.now();
    this.id = Random().nextInt(1000).toString();
  }

  factory Todo.fromJson(Map<String, dynamic> data) => _$TodoFromJson(data);

  late DateTime createdAt;
  late String id;

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}

abstract class _Todo with Store {
  _Todo(this.title);

  @observable
  String title = '';

  @observable
  bool completed = false;
}
