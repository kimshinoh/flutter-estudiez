import 'package:flutter/material.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/extensions/string_extension.dart';
import 'package:fruity/utils/datetime_utils.dart';

class SelectReceivedTime extends StatelessWidget {
  const SelectReceivedTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final receiveTime = DateTime(2022, 4, 14, 12, 00);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Thời gian nhận hàng',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  size: 20,
                  color: Colors.grey,
                ),
                SizedBox(width: 5),
                Text(
                  'Giao ngay lúc ${DateTimeHelper.formatDate(receiveTime, "HH:mm")}, ${DateTimeHelper.getVietnameseAdverbsOfTime(DateTime.now(), receiveTime).capitalize()}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            TextButton(
              child: Text("Thay đổi",
                  style: TextStyle(fontSize: 14, color: Colors.blue)),
              onPressed: () {
                showModalBottomSheet<void>(
                  // border top corner
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),

                  // close button in top right corn
                  enableDrag: false,
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: _selectTime(),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        )
      ],
    );
  }
}

class _selectTime extends StatelessWidget {
  _selectTime({Key? key}) : super(key: key);
  late FixedExtentScrollController _controller = FixedExtentScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 50,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close)),
              ),
              const Text(
                'Thời gian nhận hàng',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 50,
                child: TextButton(
                  child: Text("Xong",
                      style: TextStyle(fontSize: 14, color: Colors.blue)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
            height: 1,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        bottom: 0,
                        right: 0,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: AppColors.backgroudGrey,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ListWheelScrollView.useDelegate(
                          controller: _controller,
                          itemExtent: 50,
                          perspective: 0.001,
                          diameterRatio: 1.6,
                          physics: const FixedExtentScrollPhysics(),
                          magnification: 1.3,
                          useMagnifier: true,
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 13,
                            builder: (context, index) {
                              return Container(
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    '${index == 0 ? '00' : index * 2}',
                                    style: TextStyle(fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // am or pm
                Container(
                  width: 70,
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 50,
                    perspective: 0.005,
                    diameterRatio: 1.2,
                    physics: FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 2,
                      builder: (context, index) {
                        if (index == 0) {
                          return Container(
                            child: Text(
                              'AM',
                              style: TextStyle(fontSize: 16),
                            ),
                          );
                        } else {
                          return Container(
                            child: Text(
                              'PM',
                              style: TextStyle(fontSize: 16),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
