import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _topBar(),
                    _welcomeText(),
                    const SizedBox(height: 20),
                    _process(),
                  ],
                ))));
  }

  Widget _process() {
    return IntrinsicHeight(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                // final Product _product = _productStore.productsSaleShock[index];
                return InkWell(
                  onTap: () {},
                  child: _cardProcess(),
                );
              },
            )));
  }

  Widget _cardProcess() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.all(10),
        width: 130,
        decoration: const BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            image: AssetImage("assets/images/card.jpg"),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: CircularPercentIndicator(
                  radius: 35,
                  lineWidth: 5,
                  animation: true,
                  percent: 0.7,
                  center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "70.0",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0),
                        ),
                        Text(
                          "Percent",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0),
                        )
                      ]),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.blue.shade500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Biology",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Chapter 1",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "12 Aug 2021",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ]));
  }

  Widget _welcomeText() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello,",
            style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Truong Manh Nguyen",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                wordSpacing: 2),
          ),
        ],
      ),
    );
  }

  Widget _topBar() {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            ),
          ),
          Row(
            children: [
              Container(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_none_outlined),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(right: 16),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(
                        "https://scontent.fsgn2-1.fna.fbcdn.net/v/t39.30808-6/308505217_1594721400924906_3025204205154832825_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=2lJNGFkqN3MAX95hzcy&tn=MMQY6WMhs1Yzm49w&_nc_ht=scontent.fsgn2-1.fna&oh=00_AT-7ehVgitOfs9wIgkFlO58xGwK9IcqyoInjUVz_jeQ75g&oe=633D3EFE"),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
