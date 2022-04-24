import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/stores/user/auth_store.dart';
import 'package:fruity/stores/user_address/form_update_user_address_store.dart';
import 'package:fruity/utils/notify_util.dart';
import 'package:provider/provider.dart';

class ButtonRemoveUserAddresss extends StatelessWidget {
  String userAddressId;

  ButtonRemoveUserAddresss({Key? key, required this.userAddressId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthStore _authStore = context.read<AuthStore>();

    FormUpdateUserAddressStore _formUpdateUserAddressStore =
        context.read<FormUpdateUserAddressStore>();

    return SizedBox(
      height: 60,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Observer(builder: (_) {
              return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () async {
                    await _formUpdateUserAddressStore.removeUserAddress(
                      _authStore.userId,
                    );
                    await _authStore.userAddressStore.getUserAddresses();
                    Navigator.of(context).pop();
                    Future.delayed(Duration.zero, () {
                      NotifyHelper.success(context, 'Xóa địa chỉ thành công');
                    });
                  },
                  child: _formUpdateUserAddressStore.isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Xóa địa chỉ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ));
            }),
          ),
        ),
      ),
    );
  }
}
