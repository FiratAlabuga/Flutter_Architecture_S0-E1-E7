// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_view_m.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TestViewModel on _TestViewModelBase, Store {
  final _$numbAtom = Atom(name: '_TestViewModelBase.numb');

  @override
  int get numb {
    _$numbAtom.reportRead();
    return super.numb;
  }

  @override
  set numb(int value) {
    _$numbAtom.reportWrite(value, super.numb, () {
      super.numb = value;
    });
  }

  final _$_TestViewModelBaseActionController =
      ActionController(name: '_TestViewModelBase');

  @override
  void incNumber() {
    final _$actionInfo = _$_TestViewModelBaseActionController.startAction(
        name: '_TestViewModelBase.incNumber');
    try {
      return super.incNumber();
    } finally {
      _$_TestViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
numb: ${numb}
    ''';
  }
}
