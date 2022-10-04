import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CourseReportScreen extends StatefulWidget {
  const CourseReportScreen({Key? key}) : super(key: key);

  @override
  State<CourseReportScreen> createState() => _CourseReportScreen();
}

class _CourseReportScreen extends State<CourseReportScreen> {
  int _selectedIndex = 3;
  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }


 void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/card.jpg"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _topBar(),
                    _header(),
                    const SizedBox(height: 30),
                    _miniDivider(),
                    const SizedBox(height: 10),
                    _main(),
                  ],
                )),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.task_rounded),
                  label: 'Task',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  label: 'Test',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.report),
                  label: 'Report',
                  
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Color.fromARGB(255, 5, 142, 216),
              onTap: _onItemTapped,
              unselectedItemColor: Colors.grey,
            )));
  }

  Widget _miniDivider() {
    return Container(
      height: 4,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade300,
      ),
    );
  }

  Widget _main() {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Course Report',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(),
            Container(
                child:
                    IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)))
          ]),
          Expanded(
              child: SingleChildScrollView(
                  child: Column(children: [
            const SizedBox(height: 10),
            _course(),
            const SizedBox(height: 20),
            _Counseling_history(),
          ])))
        ],
      ),
    ));
  }

  Widget _header() {
    return Container(
        margin: const EdgeInsets.only(top: 24),
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 16),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://scontent.fsgn2-1.fna.fbcdn.net/v/t39.30808-6/308505217_1594721400924906_3025204205154832825_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=2lJNGFkqN3MAX95hzcy&tn=MMQY6WMhs1Yzm49w&_nc_ht=scontent.fsgn2-1.fna&oh=00_AT-7ehVgitOfs9wIgkFlO58xGwK9IcqyoInjUVz_jeQ75g&oe=633D3EFE"),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Truong Manh Nguyen",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "0705133876",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      wordSpacing: 2),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Class 6",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      wordSpacing: 2),
                ),
              ],
            ),
          ],
        ));
  }

  Widget _topBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
          ),
          Container(
              child: IconButton(onPressed: () {}, icon: Icon(Icons.settings)))
        ],
      ),
    );
  }

  Widget _course() {
    List<Map<String, String>> courses = [];
    courses = [
      {
        "name": "Physics",
        "title": "Bruce Crawford",
      },
      {
        "name": "Biology",
        "title": "Madge Jefferson",
      },
      {
        "name": "Math",
        "title": "Rena Brew",
      },
      {
        "name": "Physics",
        "title": "Bruce Crawford",
      },
      {
        "name": "Physics",
        "title": "Bruce Crawford",
      },
      {
        "name": "Physics",
        "title": "Bruce Crawford",
      }
    ];
    return Container(
        child: CarouselSlider(
      options: CarouselOptions(
        height: 200,
        aspectRatio: 16 / 8,
        viewportFraction: 0.8,
        initialPage: 2,
        reverse: false,
        disableCenter: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        scrollDirection: Axis.horizontal,
      ),
      items: courses.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/card.jpg"),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Container(
                      child: Column(children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 20),
                                  padding: EdgeInsets.only(
                                      right: 8, left: 8, top: 5, bottom: 5),
                                  child: Text("Assessment",
                                      style: TextStyle(color: Colors.white)),
                                  decoration: const BoxDecoration(
                                    // shape: BoxShape.circle,
                                    border: Border(
                                      top: BorderSide(color: Color(0xFFFFFFFF)),
                                      left:
                                          BorderSide(color: Color(0xFFFFFFFF)),
                                      right:
                                          BorderSide(color: Color(0xFFFFFFFF)),
                                      bottom:
                                          BorderSide(color: Color(0xFFFFFFFF)),
                                    ),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                  )),
                            ])
                      ]),
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                            padding: EdgeInsets.only(left: 20),
                            margin: EdgeInsets.only(top: 80),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(item["name"]!,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w600)),
                                const SizedBox(height: 5),
                                Text(item["title"]!,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400))
                              ],
                            )))
                  ],
                ));
          },
        );
      }).toList(),
    ));
  }

  Widget _Counseling_history() {
    return Container(
        child: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          margin: EdgeInsets.only(bottom: 18),
          child: Text(
            "Counseling History",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
      Container(
          child: Column(
        children: [
          Container(
              child: Column(children: [
            Container(
                margin: EdgeInsets.only(bottom: 15),
                padding:
                    EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 217, 216, 216).withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Friday, 09 August 2019",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                      "https://scontent.fsgn2-1.fna.fbcdn.net/v/t39.30808-6/308505217_1594721400924906_3025204205154832825_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=2lJNGFkqN3MAX95hzcy&tn=MMQY6WMhs1Yzm49w&_nc_ht=scontent.fsgn2-1.fna&oh=00_AT-7ehVgitOfs9wIgkFlO58xGwK9IcqyoInjUVz_jeQ75g&oe=633D3EFE"),
                                ),
                                Container(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Education consultantion",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    const SizedBox(height: 5),
                                    Text("Consultantion guidance",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 142, 141, 141))),
                                  ],
                                )),
                                Text("8:30",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            Color.fromARGB(255, 188, 188, 188)))
                              ]))
                    ]))
          ])),
          Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Column(children: [
                Container(
                    padding: EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 194, 193, 193)
                              .withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Friday, 09 August 2019",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(
                                          "https://scontent.fsgn2-1.fna.fbcdn.net/v/t39.30808-6/308505217_1594721400924906_3025204205154832825_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=2lJNGFkqN3MAX95hzcy&tn=MMQY6WMhs1Yzm49w&_nc_ht=scontent.fsgn2-1.fna&oh=00_AT-7ehVgitOfs9wIgkFlO58xGwK9IcqyoInjUVz_jeQ75g&oe=633D3EFE"),
                                    ),
                                    Container(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Education consultantion",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500)),
                                        const SizedBox(height: 5),
                                        Text("Consultantion guidance",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color.fromARGB(
                                                    255, 142, 141, 141))),
                                      ],
                                    )),
                                    Text("8:30",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 188, 188, 188)))
                                  ]))
                        ]))
              ])),
          Container(
              child: Column(children: [
            Container(
                padding:
                    EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Friday, 09 August 2019",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                      "https://scontent.fsgn2-1.fna.fbcdn.net/v/t39.30808-6/308505217_1594721400924906_3025204205154832825_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=2lJNGFkqN3MAX95hzcy&tn=MMQY6WMhs1Yzm49w&_nc_ht=scontent.fsgn2-1.fna&oh=00_AT-7ehVgitOfs9wIgkFlO58xGwK9IcqyoInjUVz_jeQ75g&oe=633D3EFE"),
                                ),
                                Container(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Education consultantion",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    const SizedBox(height: 5),
                                    Text("Consultantion guidance",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 142, 141, 141))),
                                  ],
                                )),
                                Text("8:30",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            Color.fromARGB(255, 188, 188, 188)))
                              ]))
                    ]))
          ]))
        ],
      ))
    ])));
  }
}
