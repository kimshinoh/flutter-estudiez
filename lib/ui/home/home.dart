import 'package:flutter/material.dart';
import 'package:fruity/ui/home/home_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
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
              child: const SizedBox(
                height: 2000,
              ),
            ),
          )
        ],
      ),
    );
  }
}
