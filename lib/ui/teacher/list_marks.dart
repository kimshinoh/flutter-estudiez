import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/data/network/rest_client.dart';
import 'package:fruity/data/sharedpref/constants/preferences.dart';
import 'package:fruity/data/sharedpref/shared_preference_helper.dart';
import 'package:fruity/models/mark/teacher_mark.dart';
import 'package:fruity/models/user/teacher.dart';
import 'package:fruity/ui/personal/widgets/personal_header.dart';
import 'package:fruity/utils/notify_util.dart';
import 'package:fruity/utils/string.dart';
import 'package:fruity/widgets/scrollable_widget.dart';
import 'package:fruity/widgets/text_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ListMark extends StatefulWidget {
  final String subjectClassId;
  final String subjectName;
  final String subjectCode;
  const ListMark(
      {Key? key,
      required this.subjectClassId,
      required this.subjectCode,
      required this.subjectName})
      : super(key: key);

  @override
  _ListMarkState createState() => _ListMarkState();
}

class _ListMarkState extends State<ListMark> {
  String subjectClassId = '';
  String subjectName = '';
  String subjectCode = '';
  List<String> mapHeader = [];
  List<TeacherMark> listMark = [];
  List<DataColumn> listColumn = [];
  List<DataRow> listRow = [];
  Timer? _debounce;
  bool isInProgress = false;
  final TextEditingController _searchController = TextEditingController();
  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    subjectClassId = widget.subjectClassId;
    subjectName = widget.subjectName;
    subjectCode = widget.subjectCode;
    _getMarkOfSubjectClass();
    super.initState();
  }

  List<DataColumn> _getColumn(List<TeacherMark> _listMark) {
    List<String> listColumnString = ["Student"];
    setState(() {
      mapHeader = [];
      mapHeader.add("Student");
    });
    for (var i = 0; i < _listMark.length; i++) {
      for (var j = 0; j < _listMark[i].exams.length; j++) {
        if (!listColumnString.contains(_listMark[i].exams[j].exam!)) {
          setState(() {
            mapHeader.add(StringHelper.getAcronym(_listMark[i].exams[j].exam!));
          });
          listColumnString.add(_listMark[i].exams[j].exam!);
        }
      }
    }
    List<DataColumn> listColumn = [];
    for (var i = 0; i < listColumnString.length; i++) {
      if (i == 0) {
        listColumn.add(DataColumn(
          label: Text(
            listColumnString[i],
          ),
        ));
      } else {
        listColumn.add(DataColumn(
          label: Text(
            StringHelper.getAcronym(listColumnString[i]),
          ),
        ));
      }
    }
    return listColumn;
  }

  List<DataRow> _getRow(List<TeacherMark> _listMark) {
    List<DataRow> listRow = [];
    for (var i = 0; i < _listMark.length; i++) {
      List<DataCell> listCell =
          List.filled(mapHeader.length, DataCell(Text("")));
      listCell[0] = DataCell(Text(_listMark[i].student!));
      for (var j = 0; j < _listMark[i].exams.length; j++) {
        int indexOfCurrentCell = mapHeader
            .indexOf(StringHelper.getAcronym(_listMark[i].exams[j].exam!));
        listCell[indexOfCurrentCell] = DataCell(
            Text(_listMark[i].exams[j].score!.toString()),
            showEditIcon: true, onTap: () {
          editMark(i, j);
        });
      }
      listRow.add(DataRow(cells: listCell));
    }
    return listRow;
  }

  Future editMark(int indexStudent, int indexMark) async {
    final score = await showTextDialog(context,
        title: "Edit",
        value: listMark[indexStudent].exams[indexMark].score.toString());
    if (score != null) {
      await _updateMark(indexStudent, indexMark, score.toString());
    }
  }

  Future _updateMark(int indexStudent, int indexMark, String score) async {
    setState(() {
      isInProgress = true;
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(Preferences.token);
    final String studentId = listMark[indexStudent].studentId!;
    final String examId = listMark[indexMark].exams[indexMark].examId!;
    await RestClient().put("/mark/student/$studentId/exam/$examId", headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    }, body: {
      "score": score
    }).then((value) async {
      setState(() {
        listMark[indexStudent].exams[indexMark].score =
            double.parse(score.toString());
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

  _getMarkOfSubjectClass() async {
    setState(() {
      isInProgress = true;
    });
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    var token = await _preferences.getString(Preferences.token);
    await RestClient().get("/mark/subject-class/$subjectClassId", headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    }).then((value) async {
      final parsed = jsonDecode(value.body);
      setState(() {
        listMark = parsed
            .map<TeacherMark>(
                (json) => TeacherMark.fromJson(json as Map<String, dynamic>))
            .toList() as List<TeacherMark>;
        listColumn = _getColumn(listMark);
        listRow = _getRow(listMark);
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

  Widget _main() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        isInProgress
            ? const LinearProgressIndicator()
            : ScrollableWidget(
                child: DataTable(
                columns: listColumn,
                rows: listRow,
                columnSpacing: 30,
              )),
      ],
    );
  }

  Widget _topBar() {
    final double width = MediaQuery.of(context).size.width;
    return Container(
        padding: EdgeInsets.fromLTRB(16, 40, 16, 0),
        height: 150,
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
                SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
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
          ]),
          Positioned(
            top: 50,
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
                    StringHelper.maxLength(subjectName, 20),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subjectCode,
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
