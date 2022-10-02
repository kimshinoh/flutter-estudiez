import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CourseReportScreen extends StatefulWidget {
  const CourseReportScreen({Key? key}) : super(key: key);

  @override
  State<CourseReportScreen> createState() => _CourseReportScreen();
}

class _CourseReportScreen extends State<CourseReportScreen> {
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
                ))));
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
          const SizedBox(height: 10),
          _course(),
          const SizedBox(height: 20),
          _Counseling_history(),
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
    List<Map<String, dynamic>> courses = [];
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
        aspectRatio: 16 / 2,
        viewportFraction: 0.8,
        initialPage: 2,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        scrollDirection: Axis.horizontal,
      ),
      items: courses.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ), //BorderRadius.all
                ),
                child: Text(
                  'text $i',
                  style: TextStyle(fontSize: 16.0),
                ));
          },
        );
      }).toList(),
    ));
  }

  Widget _Counseling_history() {
    final List<Map<String, Object>> history = [
      {
        "timeDay": "Firday, 07 August 2019",
        "avatar":
            "https://scontent.fsgn2-1.fna.fbcdn.net/v/t39.30808-6/308505217_1594721400924906_3025204205154832825_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=2lJNGFkqN3MAX95hzcy&tn=MMQY6WMhs1Yzm49w&_nc_ht=scontent.fsgn2-1.fna&oh=00_AT-7ehVgitOfs9wIgkFlO58xGwK9IcqyoInjUVz_jeQ75g&oe=633D3EFE",
        "title": "Education consutlantion",
        "description": "Consutlantion guidance",
        "timeHours": "9:20"
      },
      {
        "timeDay": "Firday, 07 August 2019",
        "avatar":
            "https://scontent.fsgn2-1.fna.fbcdn.net/v/t39.30808-6/308505217_1594721400924906_3025204205154832825_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=2lJNGFkqN3MAX95hzcy&tn=MMQY6WMhs1Yzm49w&_nc_ht=scontent.fsgn2-1.fna&oh=00_AT-7ehVgitOfs9wIgkFlO58xGwK9IcqyoInjUVz_jeQ75g&oe=633D3EFE",
        "title": "Education consutlantion",
        "description": "Consutlantion guidance",
        "timeHours": "9:20"
      },
      {
        "timeDay": "Firday, 07 August 2019",
        "avatar":
            "https://scontent.fsgn2-1.fna.fbcdn.net/v/t39.30808-6/308505217_1594721400924906_3025204205154832825_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=2lJNGFkqN3MAX95hzcy&tn=MMQY6WMhs1Yzm49w&_nc_ht=scontent.fsgn2-1.fna&oh=00_AT-7ehVgitOfs9wIgkFlO58xGwK9IcqyoInjUVz_jeQ75g&oe=633D3EFE",
        "title": "Education consutlantion",
        "description": "Consutlantion guidance",
        "timeHours": "9:20"
      },
      {
        "timeDay": "Firday, 07 August 2019",
        "avatar":
            "https://scontent.fsgn2-1.fna.fbcdn.net/v/t39.30808-6/308505217_1594721400924906_3025204205154832825_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=2lJNGFkqN3MAX95hzcy&tn=MMQY6WMhs1Yzm49w&_nc_ht=scontent.fsgn2-1.fna&oh=00_AT-7ehVgitOfs9wIgkFlO58xGwK9IcqyoInjUVz_jeQ75g&oe=633D3EFE",
        "title": "Education consutlantion",
        "description": "Consutlantion guidance",
        "timeHours": "9:20"
      },
      {
        "timeDay": "Firday, 07 August 2019",
        "avatar":
            "https://scontent.fsgn2-1.fna.fbcdn.net/v/t39.30808-6/308505217_1594721400924906_3025204205154832825_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=2lJNGFkqN3MAX95hzcy&tn=MMQY6WMhs1Yzm49w&_nc_ht=scontent.fsgn2-1.fna&oh=00_AT-7ehVgitOfs9wIgkFlO58xGwK9IcqyoInjUVz_jeQ75g&oe=633D3EFE",
        "title": "Education consutlantion",
        "description": "Consutlantion guidance",
        "timeHours": "9:20"
      }
    ];
    return Container(
        child: Container(
            child: Column(
      children: [
        Container(
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
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: history == null ? 0 : history.length,
                    itemBuilder: (context, index) {
                      final historyCard = history[index];
                      return InkWell(
                        onTap: () {},
                        child: Column(children: [
                          Container(
                              margin: EdgeInsets.only(top: 50, bottom: 50),
                              height: double.infinity,
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
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Text(historyCard["timeDay"].toString() ?? ""))
                        ]),
                      );
                    }))
          ],
        ))
      ],
    )));
  }
}
