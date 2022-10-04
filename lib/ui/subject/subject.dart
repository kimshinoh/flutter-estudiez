import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({Key? key}) : super(key: key);

  @override
  State<SubjectScreen> createState() => _SubjectScreen();
}

class _SubjectScreen extends State<SubjectScreen> {
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
                child: Column(
              children: [_topBar(), _main()],
            ))));
  }

  Widget chip(String label, Color color) {
    return Chip(
      labelPadding: EdgeInsets.all(5.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.grey.shade600,
        child: Text(label[0].toUpperCase()),
      ),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(6.0),
    );
  }

  Widget _main() {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Expanded(
        child: Container(
      padding: const EdgeInsets.fromLTRB(16, 60, 16, 0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'All Subjects',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                  onTap: () {
                    showModalBottomSheet<void>(
                        // border top corner
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),

                        // close button in top right corn

                        enableDrag: true,
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return BottomSheet(
                            onClosing: () {},
                            builder: (BuildContext context) {
                              List<String> typeFilter = [];
                              return StatefulBuilder(
                                  builder: (BuildContext context, setState) =>
                                      Container(
                                        height: height * 0.6,
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 30, 20, 16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Filter By:",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.close,
                                                  color: Colors.grey,
                                                )
                                              ],
                                            ),
                                            // const SizedBox(height: 20),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Type",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Wrap(
                                                  spacing: 10,
                                                  runSpacing: 10,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          if (typeFilter
                                                              .contains(
                                                                  "Basic")) {
                                                            typeFilter.remove(
                                                                "Basic");
                                                          } else {
                                                            typeFilter
                                                                .add("Basic");
                                                          }
                                                        });
                                                      },
                                                      child: chip(
                                                          "Basic",
                                                          typeFilter.contains(
                                                                  "Basic")
                                                              ? Colors.blue
                                                              : Colors.grey),
                                                    ),
                                                    InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            if (typeFilter
                                                                .contains(
                                                                    "Major")) {
                                                              typeFilter.remove(
                                                                  "Major");
                                                            } else {
                                                              typeFilter
                                                                  .add("Major");
                                                            }
                                                          });
                                                        },
                                                        child: chip(
                                                            "Major",
                                                            typeFilter.contains(
                                                                    "Major")
                                                                ? Colors.blue
                                                                : Colors.grey)),
                                                    InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            if (typeFilter
                                                                .contains(
                                                                    "Physical")) {
                                                              typeFilter.remove(
                                                                  "Physical");
                                                            } else {
                                                              typeFilter.add(
                                                                  "Physical");
                                                            }
                                                          });
                                                        },
                                                        child: chip(
                                                            "Physical",
                                                            typeFilter.contains(
                                                                    "Physical")
                                                                ? Colors.blue
                                                                : Colors.grey)),
                                                    InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            if (typeFilter.contains(
                                                                "Soft skills")) {
                                                              typeFilter.remove(
                                                                  "Soft skills");
                                                            } else {
                                                              typeFilter.add(
                                                                  "Soft skills");
                                                            }
                                                          });
                                                        },
                                                        child: chip(
                                                            "Soft skills",
                                                            typeFilter.contains(
                                                                    "Soft skills")
                                                                ? Colors.blue
                                                                : Colors.grey)),
                                                  ],
                                                ),
                                                Divider(
                                                  color: Colors.grey,
                                                  thickness: 1,
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                width: double.infinity,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Apply",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ));
                            },
                          );
                        });
                  },
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.filter_alt_outlined,
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Filter',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            Icons.arrow_drop_down,
                            size: 20,
                          ),
                        ],
                      )))
            ],
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                  height: height * 0.5,
                  child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.book,
                                  size: 40,
                                  color: Colors.blue.shade600,
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Subject #${index + 1}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Basic',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '19/10/2022',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Doing',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.orange),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  )))
        ],
      ),
    ));
  }

  Widget _topBar() {
    final double width = MediaQuery.of(context).size.width;
    return Container(
        padding: EdgeInsets.fromLTRB(16, 40, 16, 0),
        height: 200,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/card.jpg"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        child: Stack(clipBehavior: Clip.values[0], children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_back)),
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
                              "https://i.stack.imgur.com/l60Hf.png"),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(16, 10, 0, 0),
              child: Text(
                "Your Subject",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ]),
          Positioned(
            top: 100,
            left: 45,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              height: 100,
              width: width * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Information Technology",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Software Engineering",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    height: 20,
                    thickness: 5,
                    indent: 20,
                    endIndent: 20,
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}
