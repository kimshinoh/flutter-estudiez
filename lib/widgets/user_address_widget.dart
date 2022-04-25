import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/routes.dart';
import 'package:fruity/stores/user/auth_store.dart';
import 'package:fruity/ui/user_address/create_user_address_screen.dart';
import 'package:fruity/widgets/login_button.dart';
import 'package:provider/provider.dart';

class UserAddressWidget extends StatefulWidget {
  const UserAddressWidget({Key? key}) : super(key: key);

  @override
  State<UserAddressWidget> createState() => _UserAddressState();
}

class _UserAddressState extends State<UserAddressWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = 0;

  final List<Widget> _tabs = [const _HomeAddress(), const _StoreAddress()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(
      vsync: this,
      length: _tabs.length,
      initialIndex: selectedIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
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
            unselectedLabelStyle: const TextStyle(fontSize: 14),
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
    final AuthStore _authStore = context.read<AuthStore>();

    return Observer(
      builder: (_) {
        return SizedBox(
          child: _authStore.isLoggedIn &&
                  _authStore.userAddressStore.defaultAddress != null
              ? const _DefaultAddress()
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Text('Chưa có địa chỉ nào được chọn')),
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {
                            if (_authStore.isLoggedIn) {
                              Navigator.of(context).pushNamed(
                                Routes.create_user_address,
                                arguments: CreateUserAddressAgruments(
                                  isDefault: true,
                                ),
                              );
                            } else {
                              ShowButtomSheetLogin(context);
                            }
                          },
                          child: const Text(
                            'Thêm địa chỉ',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  )),
        );
      },
    );
  }
}

class _DefaultAddress extends StatelessWidget {
  const _DefaultAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthStore _authStore = context.read<AuthStore>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Giao tới',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.list_user_addressres);
                },
                child: Text(
                  'Thay đổi',
                  style: TextStyle(color: Colors.blue.shade400, fontSize: 14),
                ),
              )
            ],
          ),
          Row(
            children: [
              const Icon(Icons.person_outline),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  _authStore.userAddressStore.defaultAddress!.fullName,
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
              Text(_authStore.userAddressStore.defaultAddress!.phoneNumber)
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
                child:
                    Text(_authStore.userAddressStore.defaultAddress!.address),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _StoreAddress extends StatelessWidget {
  const _StoreAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
          const SizedBox(
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
