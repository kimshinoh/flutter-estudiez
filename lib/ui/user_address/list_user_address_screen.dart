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
        body: Observer(
          builder: (_) {
            return Container(
              child: _authStore.userAddressStore.userAddresses.isEmpty
                  ? Center(
                      child: _addressEmpty(),
                    )
                  : ListView(
                      children: [
                        Observer(builder: (_) {
                          return SizedBox(
                              child:
                                  _authStore.userAddressStore.defaultAddress !=
                                          null
                                      ? Container(
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 8),
                                            child: UserAddressItemWidget(
                                              userAddress: _authStore
                                                  .userAddressStore
                                                  .defaultAddress!,
                                            ),
                                          ))
                                      : null);
                        }),
                        const SizedBox(
                          height: 10,
                        ),
                        if (_authStore.userAddressStore.hasNonDefaultAddress)
                          Container(
                              color: Colors.white,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: ListUserAddressesWidget(),
                              ))
                        else
                          const SizedBox.shrink()
                      ],
                    ),
            );
          },
        ));
  }
}

Widget _addressEmpty() {
  return Builder(
    builder: (BuildContext context) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage('assets/images/empty_address.png'),
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.width * 0.5,
              fit: BoxFit.cover,
            ),
            const Text(
              'Bạn chưa có địa chỉ nào',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      );
    },
  );
}
