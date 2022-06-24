// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LocationStore on _LocationStoreBase, Store {
  late final _$addressAtom =
      Atom(name: '_LocationStoreBase.address', context: context);

  @override
  String get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(String value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$positionAtom =
      Atom(name: '_LocationStoreBase.position', context: context);

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

  late final _$updatePositionAsyncAction =
      AsyncAction('_LocationStoreBase.updatePosition', context: context);

  @override
  Future<void> updatePosition() {
    return _$updatePositionAsyncAction.run(() => super.updatePosition());
  }

  @override
  String toString() {
    return '''
address: ${address},
position: ${position}
    ''';
  }
}
