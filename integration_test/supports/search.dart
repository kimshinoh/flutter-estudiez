import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import '../pump_until_found.dart';

class Search {
  const Search(this.tester);

  final WidgetTester tester;
  Future<void> openSearchScreen() async {
    final searchBtn = find.byKey(const Key('search_btn'));
    await tester.tap(searchBtn);
    await tester.pumpAndSettle();
  }

  Future<void> blankSearchField() async {
    final searchField = find.byKey(const Key('search_field'));
    expect(searchField, findsOneWidget);
  }

  Future<void> normalSearch() async {
    final searchField = find.byKey(const Key('search_field'));
    await tester.enterText(searchField, 'Dừa');
    await tester.pumpAndSettle();
    expect(find.text('Dừa'), findsWidgets);
  }

  Future<void> exit() async {
    final exitBtn = find.byKey(const Key('exit_search'));
    await tester.tap(exitBtn);
    await tester.pumpAndSettle();
  }
}
