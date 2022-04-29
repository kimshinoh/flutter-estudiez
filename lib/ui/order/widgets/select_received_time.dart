import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/extensions/string_extension.dart';
import 'package:fruity/stores/order/confirm_order_store.dart';
import 'package:fruity/utils/datetime_util.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class SelectReceivedTime extends StatelessWidget {
  const SelectReceivedTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderConfirmationStore _orderConfirmationStore =
        context.read<OrderConfirmationStore>();
    _orderConfirmationStore.setupUpdateRecevedAt();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Thời gian nhận hàng',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Observer(
                builder: (_) {
                  return Text(
                    'Giao ngay lúc ${DateTimeHelper.formatDate(_orderConfirmationStore.createOrderStore.receivedAt, "HH:mm")}, ${DateTimeHelper.getVietnameseAdverbsOfTime(DateTime.now(), _orderConfirmationStore.createOrderStore.receivedAt).capitalize()}',
                    style: const TextStyle(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  );
                },
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'Thay đổi',
                style: TextStyle(fontSize: 14, color: Colors.blue),
              ),
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
                    return Provider.value(
                      value: _orderConfirmationStore,
                      child: Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: const _selectTime(),
                        ),
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

class _selectTime extends StatefulWidget {
  const _selectTime({Key? key}) : super(key: key);

  @override
  State<_selectTime> createState() => _selectTimeState();
}

class _selectTimeState extends State<_selectTime> {
  late FixedExtentScrollController _controllerDate;
  late FixedExtentScrollController _controllerTime;
  late OrderConfirmationStore _orderConfirmationStore;
  final List<ReactionDisposer> _disposers = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerDate = FixedExtentScrollController();
    _controllerTime = FixedExtentScrollController();
    _orderConfirmationStore = context.read<OrderConfirmationStore>();

    final int dateIndex = _orderConfirmationStore.getDatesCanSelect.indexWhere(
      (DateTime element) {
        return element.day ==
            _orderConfirmationStore.createOrderStore.receivedAt.day;
      },
    );

    final int timeIndex = _orderConfirmationStore.timesCanSelect.indexWhere(
      (String element) {
        return element ==
            DateTimeHelper.formatDate(
              _orderConfirmationStore.createOrderStore.receivedAt,
              'HH:mm',
            );
      },
    );

    Future.delayed(Duration.zero, () {
      if (dateIndex != -1) {
        _controllerDate.jumpToItem(dateIndex);
      }
      if (timeIndex != -1) {
        _controllerTime.jumpToItem(timeIndex);
      }
    });

    _disposers.add(
      reaction(
        (_) => _orderConfirmationStore.receivedAt,
        (DateTime receivedAt) {
          if (receivedAt.day ==
              _orderConfirmationStore.createOrderStore.receivedAt.day) {
            Future.delayed(Duration.zero, () {
              _controllerTime.jumpToItem(timeIndex);
            });
            return;
          }
          Future.delayed(Duration.zero, () {
            _controllerTime.jumpToItem(0);
          });
        },
      ),
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    _controllerDate.dispose();
    _controllerTime.dispose();
  }

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
                  icon: const Icon(Icons.close),
                ),
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
                  child: const Text(
                    'Xong',
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                  onPressed: () {
                    _orderConfirmationStore.confirmReceivedAt();
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          const Divider(
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
                          controller: _controllerDate,
                          itemExtent: 50,
                          perspective: 0.001,
                          diameterRatio: 1.6,
                          physics: const FixedExtentScrollPhysics(),
                          onSelectedItemChanged: (int index) {
                            _orderConfirmationStore.setReceivedAt(
                              _orderConfirmationStore.getDatesCanSelect[index],
                            );
                          },
                          magnification: 1.3,
                          useMagnifier: true,
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: _orderConfirmationStore
                                .getDatesCanSelect.length,
                            builder: (BuildContext context, int index) {
                              final DateTime _date = _orderConfirmationStore
                                  .getDatesCanSelect[index];
                              return SizedBox(
                                width: double.infinity,
                                child: Center(
                                  child: Observer(
                                    builder: (_) {
                                      return Text(
                                        DateTimeHelper.formatDate(
                                          _date,
                                          'dd/MM/yyyy',
                                        ),
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: DateTimeHelper.formatDate(
                                                    _date,
                                                    'dd/MM/YYYY',
                                                  ) ==
                                                  DateTimeHelper.formatDate(
                                                    _orderConfirmationStore
                                                        .receivedAt,
                                                    'dd/MM/YYYY',
                                                  )
                                              ? AppColors.palette.shade500
                                              : Colors.grey,
                                        ),
                                        textAlign: TextAlign.center,
                                      );
                                    },
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
                      Observer(
                        builder: (_) {
                          return SizedBox(
                            width: double.infinity,
                            child: ListWheelScrollView.useDelegate(
                              controller: _controllerTime,
                              itemExtent: 50,
                              perspective: 0.001,
                              diameterRatio: 1.6,
                              physics: const FixedExtentScrollPhysics(),
                              onSelectedItemChanged: (int index) {
                                _orderConfirmationStore.setTime(
                                  _orderConfirmationStore.timesCanSelect[index],
                                );
                              },
                              magnification: 1.3,
                              useMagnifier: true,
                              childDelegate: ListWheelChildBuilderDelegate(
                                childCount: _orderConfirmationStore
                                    .timesCanSelect.length,
                                builder: (BuildContext context, int index) {
                                  return SizedBox(
                                    width: double.infinity,
                                    child: Center(
                                      child: Observer(
                                        builder: (_) {
                                          final String _time =
                                              _orderConfirmationStore
                                                  .timesCanSelect[index];

                                          return Text(
                                            _orderConfirmationStore
                                                .timesCanSelect[index],
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: _orderConfirmationStore
                                                          .time ==
                                                      _time
                                                  ? AppColors.palette.shade500
                                                  : Colors.grey,
                                            ),
                                            textAlign: TextAlign.center,
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ],
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
