import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruity/constants/app_color.dart';

class UserAddress extends StatefulWidget {
  const UserAddress({Key? key}) : super(key: key);

  @override
  State<UserAddress> createState() => _UserAddressState();
}

class _UserAddressState extends State<UserAddress>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = 0;

  final List<Widget> _tabs = [_HomeAddress(), _StoreAddress()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(
        vsync: this, length: _tabs.length, initialIndex: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          TabBar(
            onTap: (int index) {
              setState(() {
                selectedIndex = index;
                _tabController.animateTo(index);
              });
            },
            indicatorColor: AppColors.palette.shade500,
            controller: _tabController,
            labelColor: AppColors.palette.shade500,
            labelStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            unselectedLabelColor: AppColors.palette.shade100,
            unselectedLabelStyle: TextStyle(fontSize: 14),
            tabs: const [
              Tab(
                icon: Icon(Icons.home),
                text: 'Giao hàng tận nơi',
              ),
              Tab(
                icon: Icon(Icons.store),
                text: 'Lấy tại cửa hàng',
              ),
            ],
          ),
          IndexedStack(
            index: selectedIndex,
            children: <Widget>[
              Visibility(
                maintainState: true,
                visible: selectedIndex == 0,
                child: const _HomeAddress(),
              ),
              Visibility(
                maintainState: true,
                visible: selectedIndex == 1,
                child: const _StoreAddress(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HomeAddress extends StatelessWidget {
  const _HomeAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
        child: Column(children: const [
          TextField(
            decoration: InputDecoration(
                labelText: 'Họ và tên',
                prefixIcon: Icon(Icons.person),
                contentPadding: EdgeInsets.all(8),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey))),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                contentPadding: EdgeInsets.all(8),
                labelText: 'Số điện thoại',
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey))),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: 'Địa chỉ',
                prefixIcon: Icon(Icons.location_on),
                contentPadding: EdgeInsets.all(8),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey))),
          )
        ]),
      ),
    );
  }
}

class _StoreAddress extends StatelessWidget {
  const _StoreAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
      child: Row(
        children: [
          Container(
            height: 45,
            color: Colors.transparent,
            child: SvgPicture.asset(
              'assets/images/onstore.svg',
              fit: BoxFit.scaleDown,
              height: 45,
              width: 45,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          const Expanded(
            child: Text(
              'Vui lòng nhận sản phẩm tại cửa hàng được chọn',
              maxLines: 2,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
