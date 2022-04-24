import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/stores/user/auth_store.dart';
import 'package:fruity/stores/user_address/form_update_user_address_store.dart';
import 'package:fruity/utils/notify_util.dart';
import 'package:provider/provider.dart';

class ButtonUpdateUserAddresss extends StatelessWidget {
  const ButtonUpdateUserAddresss({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FormUpdateUserAddressStore _formUpdateUserAddressStore =
        context.read<FormUpdateUserAddressStore>();

    AuthStore _authStore = context.read<AuthStore>();

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
                      primary: _formUpdateUserAddressStore.isValid
                          ? AppColors.palette.shade500
                          : Colors.grey),
                  onPressed: () async {
                    if (_formUpdateUserAddressStore.isValid) {
                      await _formUpdateUserAddressStore
                          .updateUserAddress(_authStore.userId);
                      await _authStore.userAddressStore.getUserAddresses();
                      Navigator.of(context).pop();
                      Future.delayed(Duration.zero, () {
                        NotifyHelper.success(context, 'Lưu địa chỉ thành công');
                      });
                    }
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
                          'Cập nhật địa chỉ',
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
