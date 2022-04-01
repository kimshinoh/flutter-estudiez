import 'package:flutter/material.dart';
import 'package:fruity/stores/user/auth_store.dart';
import 'package:fruity/ui/home/home_header.dart';
import 'package:fruity/widgets/login_bottom_sheet.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AuthStore _store;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _store = context.read<AuthStore>();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: const LoginBottomSheet(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: MyHomeHeader(
              minWidth: width * 0.75,
              searchBarMaxWidth: width * 0.94,
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              child: SizedBox(
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
