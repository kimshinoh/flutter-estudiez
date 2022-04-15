import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruity/constants/app_color.dart';

class SearchResultScreen extends StatefulWidget {
  final String search;
  const SearchResultScreen({Key? key, required this.search}) : super(key: key);

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildBody(),
      ),
    );
  }
  Widget _buildBody() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.backgroudGrey
      ),
      child: Column(
        children: [
          _header(),
          _buildFilter(),
        ],
      ),
    );
  }

  Widget _header() {
    final double width = MediaQuery.of(context).size.width;
    return Container(
        height: 70.0,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: AppColors.palette,
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.greenAccent),
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                  ),
                  height: 35,
                  padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            widget.search,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),
                      const Icon(Icons.search, color: Colors.grey),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
  Widget _buildFilter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                
              ],
            ),
          )
        ]
      )
      
    );
  }
}
