// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LocationStore on _LocationStoreBase, Store {
  Computed<Future<String>>? _$addressStrComputed;

  @override
  Future<String> get addressStr =>
      (_$addressStrComputed ??= Computed<Future<String>>(() => super.addressStr,
              name: '_LocationStoreBase.addressStr'))
          .value;

  final _$positionAtom = Atom(name: '_LocationStoreBase.position');

  @override
  Position get position {
    _$positionAtom.reportRead();
    return super.position;
  }

  @override
  set position(Position value) {
    _$positionAtom.reportWrite(value, super.position, () {
      super.position = value;
    });
  }

  final _$updatePositionAsyncAction =
      AsyncAction('_LocationStoreBase.updatePosition');

  @override
  Future<void> updatePosition() {
    return _$updatePositionAsyncAction.run(() => super.updatePosition());
  }

  @override
  String toString() {
    return '''
position: ${position},
addressStr: ${addressStr}
    ''';
  }
}
