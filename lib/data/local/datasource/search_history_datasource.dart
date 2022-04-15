import 'package:sqflite/sqflite.dart';

class SearchHistoryDataSource {
  Database db;
  SearchHistoryDataSource({required this.db});

  Future<List<String>> getAll() async {
    final List<String> searchHistories = [];
    final List<Map<String, dynamic>> maps =
        await db.query('search').catchError((err) {
    });

    for (final Map<String, dynamic> map in maps) {
      searchHistories.add(map['key'].toString());
    }
    return searchHistories;
  }

  Future<void> insert(String search) async {
    await db.insert('search', {'key': search},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> delete(String search) async {
    await db.delete('search', where: 'key = ?', whereArgs: [search]);
  }

  Future<void> deleteAll() async {
    await db.delete('search');
  }
}
