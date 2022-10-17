import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/data/network/rest_client.dart';
import 'package:fruity/data/sharedpref/constants/preferences.dart';
import 'package:fruity/data/sharedpref/shared_preference_helper.dart';
import 'package:fruity/models/user/teacher.dart';
import 'package:fruity/models/user/user.dart';
import 'package:fruity/ui/personal/widgets/personal_header.dart';
import 'package:fruity/utils/notify_util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // late SearchHistoryStore _store;
  // late SearchStore _searchStore;
  // late FocusScopeNode currentFocus;

  late List<Teacher> _teachers = [];
  List<Teacher> _teachersSearch = [];
  Timer? _debounce;
  bool isInProgress = false;
  final TextEditingController _searchController = TextEditingController();
  User _user = User("", "", "", "", "", "", null, null, null);
  @override
  void dispose() {
    _debounce?.cancel();
    _paserUser();
    super.dispose();
  }

  _paserUser() async {
    final SharedPreferences _preferences =
        await SharedPreferences.getInstance();
    String? _userString = _preferences.getString(Preferences.user);
    var token = await _preferences.getString(Preferences.token);
    if (_userString != null) {
      final parsed = jsonDecode(_userString) as Map<String, dynamic>;
      User user = User.fromJson(parsed);
      setState(() {
        _user = user;
      });
    }
  }

  @override
  void initState() {
    _getTeachers();
    super.initState();
  }

  _getTeachers() async {
    setState(() {
      isInProgress = true;
    });
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    var token = await _preferences.getString(Preferences.token);
    await RestClient().get("/teacher", headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    }).then((value) async {
      final parsed = jsonDecode(value.body);
      setState(() {
        _teachers = parsed
            .map<Teacher>(
                (json) => Teacher.fromJson(json as Map<String, dynamic>))
            .toList() as List<Teacher>;
        _teachersSearch = _teachers;
      });
    }).catchError((error) {
      print(error);
      NotifyHelper.error(context, "Something went wrong");
    }).whenComplete(() {
      if (mounted) {
        setState(() {
          isInProgress = false;
        });
      }
    });
  }

  _handleChangeSearch() {
    String keyword = _searchController.text;
    if (keyword.isEmpty) {
      setState(() {
        _teachersSearch = _teachers;
      });
    } else {
      _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () {
        setState(() {
          _teachersSearch = _teachers
              .where((element) =>
                  element.name!.toLowerCase().contains(keyword.toLowerCase()))
              .toList();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // currentFocus = FocusScope.of(context);
    return SafeArea(
        child: Scaffold(
            body: CustomScrollView(slivers: <Widget>[
      SliverPinnedHeader(
        child: Column(
          children: [
            _header(),
          ],
        ),
      ),
      SliverToBoxAdapter(
          child: Container(
        decoration: const BoxDecoration(color: AppColors.backgroudGrey),
        child: Column(
          children: [
            _list(),
          ],
        ),
      )),
    ])));
  }

  Widget _list() {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 56.0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.white,
        child: Column(
          children: [
            isInProgress
                ? const LinearProgressIndicator()
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: _teachersSearch.length,
                    itemBuilder: (BuildContext context, int index) {
                      // final String search =
                      //     searchHistory[searchHistory.length - 1 - index];
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      margin: EdgeInsets.only(right: 16),
                                      child: CircleAvatar(
                                        radius: 16,
                                        backgroundImage: NetworkImage(_teachersSearch[index].avatar ??
                                            "https://i.stack.imgur.com/l60Hf.png"),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    _teachersSearch[index].name!,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                              TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  onPressed: () {
                                    String phone =
                                        _teachersSearch[index].phone!;
                                    String url = 'tel:$phone';
                                    launchUrlString(phone);
                                  },
                                  child: Text(_teachersSearch[index].phone ??
                                      "0123456789")),
                            ],
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SizedBox(
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
                              key: Key('search_field'),
                              controller: _searchController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search by teacher name or class',
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
                              onChanged: (String value) {
                                if (_debounce?.isActive ?? false) {
                                  _debounce!.cancel();
                                }
                                _debounce = Timer(
                                    const Duration(milliseconds: 500), () {
                                  _handleChangeSearch();
                                });
                              },
                              onSubmitted: (String value) {
                                // _search(value);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
