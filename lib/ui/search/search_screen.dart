import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/stores/search_history/search_history_store.dart';
import 'package:fruity/ui/search/search_result_screen.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late SearchHistoryStore _store;
  final List<String> _hotSearch = [
    'Dừa',
    'Cà chua',
    'Cà rốt',
    'Cà phê',
    'Cà tím',
    'Cà tỏi'
  ];
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _store = context.read<SearchHistoryStore>();
    return Observer(
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              color: AppColors.backgroudGrey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _header(),
                    _historySearch(),
                    _populateSearch(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _historySearch() {
    final List<String> searchHistory = _store.searchs;
    if (searchHistory.isEmpty) {
      return Container();
    }
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 56.0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        color: Colors.white,
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: searchHistory.length,
              itemBuilder: (BuildContext context, int index) {
                final String search =
                    searchHistory[searchHistory.length - 1 - index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        search,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      onTap: () {
                        _searchController.text = search;
                        _search();
                      },
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () {
                          _store.removeItem(search);
                        },
                      ),
                    ),
                    const Divider(
                      height: 1,
                      indent: 15,
                      endIndent: 15,
                      thickness: 1,
                      color: Color.fromARGB(108, 158, 158, 158),
                    ),
                  ],
                );
              },
            ),
            Align(
              child: TextButton(
                child: const Text(
                  'Xóa tất cả',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                onPressed: () {
                  _store.clear();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _populateSearch() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      height: 250,
      color: Colors.white,
      child: IntrinsicHeight(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'assets/images/hot.png',
                    width: 50,
                  ),
                  const Text(
                    'Tìm kiếm phổ biến',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: AnimationLimiter(
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 3.4,
                  padding: const EdgeInsets.all(8.0),
                  crossAxisCount: 2,
                  children: List.generate(
                    _hotSearch.length,
                    (int index) {
                      return AnimationConfiguration.staggeredGrid(
                        columnCount: 2,
                        position: index,
                        duration: const Duration(milliseconds: 1000),
                        child: ScaleAnimation(
                          scale: 0.5,
                          child: FlipAnimation(
                            child: GestureDetector(
                              onTap: () {
                                _searchController.text = _hotSearch[index];
                                _search();
                              },
                              child: Container(
                                margin: const EdgeInsets.all(4),
                                padding: const EdgeInsets.only(left: 8),
                                decoration: const BoxDecoration(
                                  color: AppColors.backgroudGrey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(_hotSearch[index]),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _header() {
    final double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 70.0,
      child: Container(
        padding: const EdgeInsets.all(10),
        color: AppColors.palette,
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 36.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  color: Colors.white,
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  width: width * 0.8,
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Tìm tên sản phẩm, nhà cung cấp',
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                            suffixIcon: IconButton(
                              constraints: const BoxConstraints(),
                              padding: EdgeInsets.zero,
                              icon: const Icon(
                                Icons.cancel_sharp,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                _searchController.clear();
                              },
                            ),
                          ),
                          onSubmitted: (String value) {
                            _search();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Thoát',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _search() {
    final String search = _searchController.text;
    if (search.isEmpty) {
      return;
    }
    _store.addItem(search);
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => SearchResultScreen(search: search),
      ),
    );
  }
}
