// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VersionStore on _VersionStoreBase, Store {
  final _$versionAtom = Atom(name: '_VersionStoreBase.version');

  @override
  String get version {
    _$versionAtom.reportRead();
    return super.version;
  }

  @override
  set version(String value) {
    _$versionAtom.reportWrite(value, super.version, () {
      super.version = value;
    });
  }

  final _$buildNumberAtom = Atom(name: '_VersionStoreBase.buildNumber');

  @override
  String get buildNumber {
    _$buildNumberAtom.reportRead();
    return super.buildNumber;
  }

  @override
  set buildNumber(String value) {
    _$buildNumberAtom.reportWrite(value, super.buildNumber, () {
      super.buildNumber = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_VersionStoreBase.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  @override
  String toString() {
    return '''
version: ${version},
buildNumber: ${buildNumber}
    ''';
  }
}
