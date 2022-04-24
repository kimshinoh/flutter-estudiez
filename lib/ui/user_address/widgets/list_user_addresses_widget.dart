import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/models/user_address/user_address.dart';
import 'package:fruity/stores/user/auth_store.dart';
import 'package:fruity/ui/user_address/widgets/user_address_item_widget.dart';
import 'package:provider/provider.dart';

class ListUserAddressesWidget extends StatelessWidget {
  const ListUserAddressesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthStore _authStore = context.read<AuthStore>();

    return Observer(builder: (BuildContext context) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Địa chỉ đã lưu',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Divider(),
        const SizedBox(height: 8),
        if (_authStore.isLoggedIn)
          Observer(builder: (_) {
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final UserAddress userAddress =
                    _authStore.userAddressStore.nonDefaultAddresses[index];
                return UserAddressItemWidget(userAddress: userAddress);
              },
              separatorBuilder: (BuildContext context, int int) =>
                  const Divider(
                thickness: 1,
                height: 1,
              ),
              itemCount: _authStore.userAddressStore.nonDefaultAddresses.length,
            );
          })
        else
          const Center(
            child: Text('Please login to see this page'),
          ),
      ]);
    });
  }
}
