// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) => Todo(
      json['title'] as String,
    )
      ..completed = json['completed'] as bool
      ..createdAt = DateTime.parse(json['createdAt'] as String)
      ..id = json['id'] as String;

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'title': instance.title,
      'completed': instance.completed,
      'createdAt': instance.createdAt.toIso8601String(),
      'id': instance.id,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Todo on _Todo, Store {
  final _$titleAtom = Atom(name: '_Todo.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$completedAtom = Atom(name: '_Todo.completed');

  @override
  bool get completed {
    _$completedAtom.reportRead();
    return super.completed;
  }

  @override
  set completed(bool value) {
    _$completedAtom.reportWrite(value, super.completed, () {
      super.completed = value;
    });
  }

  @override
  String toString() {
    return '''
title: ${title},
completed: ${completed}
    ''';
  }
}
