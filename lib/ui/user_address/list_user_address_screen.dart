import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/stores/user/auth_store.dart';
import 'package:fruity/ui/user_address/widgets/create_user_address_button.dart';
import 'package:fruity/ui/user_address/widgets/list_user_addresses_widget.dart';
import 'package:fruity/ui/user_address/widgets/user_address_item_widget.dart';
import 'package:provider/provider.dart';

class ListUserAddressScreen extends StatelessWidget {
  const ListUserAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthStore _authStore = context.read<AuthStore>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Địa chỉ nhận hàng'),
          centerTitle: true,
        ),
        bottomNavigationBar:
            const BottomAppBar(child: ButtonCreateUserAddress()),
        body: ListView(
          children: [
            Observer(builder: (_) {
              return SizedBox(
                child: _authStore.userAddressStore.defaultAddress != null
                    ? Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: UserAddressItemWidget(
                            userAddress:
                                _authStore.userAddressStore.defaultAddress!,
                          ),
                        ))
                    : const Center(
                        child: Text('Bạn chưa có địa chỉ nào'),
                      ),
              );
            }),
            const SizedBox(
              height: 10,
            ),
            if (_authStore.userAddressStore.hasNonDefaultAddress)
              Container(
                  color: Colors.white,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListUserAddressesWidget(),
                  ))
            else
              const SizedBox.shrink()
          ],
        ));
  }
}
