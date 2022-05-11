import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/models/order/order.dart';
import 'package:fruity/stores/order/order_detail_store.dart';
import 'package:fruity/ui/order/widgets/cancel_order_button.dart';
import 'package:fruity/ui/order/widgets/list_order_item.dart';
import 'package:fruity/ui/order/widgets/seller_info_widget.dart';
import 'package:fruity/utils/currency_util.dart';
import 'package:fruity/utils/datetime_util.dart';
import 'package:fruity/widgets/map_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class OrderDetailAgruments {
  final String orderId;
  OrderDetailAgruments(this.orderId);
}

class OrderDetailScreen extends StatelessWidget {
  OrderDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderDetailAgruments args =
        ModalRoute.of(context)!.settings.arguments as OrderDetailAgruments;

    OrderDetailStore _orderDetailStore = OrderDetailStore();
    String orderId = args.orderId;
    _orderDetailStore.getOrderDetail(args.orderId);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Chi tiết đơn hàng'),
          centerTitle: true,
        ),
        bottomNavigationBar: Provider(
          create: (_) => _orderDetailStore,
          child: ButtonOrderCancel(),
        ),
        body: Provider(
          create: (_) => _orderDetailStore,
          child: _body(orderId: orderId),
        ));
  }
}

class _body extends StatelessWidget {
  String orderId;
  _body({Key? key, required this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderDetailStore _orderDetailStore = context.read<OrderDetailStore>();

    return Observer(builder: (_) {
      return _orderDetailStore.isLoading
          ? const Center(child: CircularProgressIndicator())
          : _orderDetailStore.order != null
              ? _orderDetail()
              : const Center(child: Text('Không có dữ liệu'));
    });
  }
}

class _orderDetail extends StatelessWidget {
  _orderDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderDetailStore _orderDetailStore = context.read<OrderDetailStore>();

    return SizedBox(
      width: double.infinity,
      child: ListView(
        shrinkWrap: true,
        children: [
          MapView(
            location: LatLng(_orderDetailStore.order!.userAddress.latitude,
                _orderDetailStore.order!.userAddress.longitude),
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              child: Center(
                child: SizedBox(
                    height: 120,
                    child: Observer(builder: (_) {
                      Track lastTrack = _orderDetailStore.order!.tracks.last;

                      return Column(
                        children: [
                          Text(
                            'Đơn hàng ${lastTrack.statusText.toLowerCase()}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _tracksWidget(
                            tracks: _orderDetailStore.order!.tracks,
                          )
                        ],
                      );
                    })),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SellerInfoWidget(
                      seller: _orderDetailStore.order!.seller,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListOrderItem(),
                    const SizedBox(
                      height: 20,
                    ),
                    const _PriceInfo(),
                  ],
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: _AddressInfo()),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: _TimeInfo()),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: _OrderInfo()),
          )
        ],
      ),
    );
  }
}

class _tracksWidget extends StatelessWidget {
  List<Track> tracks;
  _tracksWidget({Key? key, required this.tracks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...tracks.asMap().entries.map((entry) {
          int index = entry.key;
          Track track = entry.value;
          return Container(
              child: Column(
                  crossAxisAlignment: tracks.length > 1
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: [
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: track.statusColorOverlay,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        Positioned(
                          child: Container(
                            decoration: BoxDecoration(
                              color: track.statusColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            width: 15,
                            height: 15,
                          ),
                        )
                      ],
                    ),
                    if (index != tracks.length - 1)
                      Container(
                          width: MediaQuery.of(context).size.width /
                              (tracks.length + 1),
                          height: 1,
                          color: track.statusColor),
                  ],
                ),
                Text(
                  track.statusText,
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  DateTimeHelper.formatDate(track.time, 'hh:mm'),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                )
              ]));
        })
      ],
    );
  }
}

class _PriceInfo extends StatelessWidget {
  const _PriceInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderDetailStore _orderConfirmationStore =
        context.read<OrderDetailStore>();
    return Observer(builder: (_) {
      Order? order = _orderConfirmationStore.order;

      if (order == null) {
        return const SizedBox.shrink();
      }

      return Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Tổng tiền ${order.orderItems.length} sản phẩm',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Text(
                  '${CurrencyHelper.withCommas(value: order.totalPrice, removeDecimal: true)} ₫',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Phí giao hàng (${order.shippingDistance}km)',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Text(
                  '${CurrencyHelper.withCommas(value: order.shippingFee, removeDecimal: true)} ₫',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Tổng tiền',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  '${CurrencyHelper.withCommas(value: order.totalPriceWithShippingFee, removeDecimal: true)} ₫',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.orange.shade700,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}

class _AddressInfo extends StatelessWidget {
  const _AddressInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderDetailStore _orderDetailStore = context.read<OrderDetailStore>();

    return Observer(
      builder: (_) {
        Order? order = _orderDetailStore.order;
        if (order == null) {
          return const SizedBox.shrink();
        }

        return Container(
          color: Colors.white,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Giao tới',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(Icons.person_outline),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      order.userAddress.fullName,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Icon(Icons.phone_outlined),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(order.userAddress.phoneNumber)
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.location_on_outlined),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(order.userAddress.address),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _OrderInfo extends StatelessWidget {
  const _OrderInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderDetailStore _orderDetailStore = context.read<OrderDetailStore>();

    return Observer(
      builder: (_) {
        Order? order = _orderDetailStore.order;
        if (order == null) {
          return const SizedBox.shrink();
        }

        return Container(
          color: Colors.white,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Thông tin đơn hàng',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Mã đơn hàng',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.grey),
                    ),
                  ),
                  Text(
                    order.textId,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Đặt hàng lúc',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.grey),
                    ),
                  ),
                  Text(
                    DateTimeHelper.formatDate(
                        order.createdAt, 'hh:mm - dd/MM/yyyy'),
                    style: const TextStyle(fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Phương thúc thanh toán',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.grey),
                    ),
                  ),
                  Text(
                    order.payment.name,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TimeInfo extends StatelessWidget {
  const _TimeInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderDetailStore _orderDetailStore = context.read<OrderDetailStore>();

    return Observer(
      builder: (_) {
        Order? order = _orderDetailStore.order;
        if (order == null) {
          return const SizedBox.shrink();
        }

        return Container(
          color: Colors.white,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Thời gian nhận hàng',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(Icons.schedule),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      DateTimeHelper.formatDate(
                          order.receivedAt, 'hh:mm - dd/MM/yyyy'),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
