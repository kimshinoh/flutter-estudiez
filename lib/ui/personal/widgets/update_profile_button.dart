import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/models/user/user.dart';
import 'package:fruity/stores/user/auth_store.dart';
import 'package:fruity/stores/user/form_update_profile_store.dart';
import 'package:fruity/utils/notify_util.dart';
import 'package:provider/provider.dart';

class ButtonUpdateUserProfile extends StatelessWidget {
  const ButtonUpdateUserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthStore _authStore = context.read<AuthStore>();
    FormUpdateProfileStore _formUploadProfileStore =
        context.read<FormUpdateProfileStore>();

    return SizedBox(
      height: 60,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Observer(
                builder: (_) {
                  return ElevatedButton(
                    key: const Key('save_profile'),
                      onPressed: () async {
                        if (_formUploadProfileStore.isValid) {
                          User? user =
                              await _formUploadProfileStore.updateProfile();
                          if (user != null) {
                            _authStore.setUser(user);
                          }

                          Navigator.pop(context);
                          Future.delayed(Duration.zero, () {
                            NotifyHelper.success(
                                context, 'Cập nhật thành công');
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: _formUploadProfileStore.isValid
                            ? AppColors.palette.shade500
                            : Colors.grey,
                      ),
                      child: Observer(builder: (_) {
                        if (_formUploadProfileStore.isLoading) {
                          return const SizedBox(
                            width: 15,
                            height: 15,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }
                        return const Text(
                          'Lưu',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      }));
                },
              )),
        ),
      ),
    );
  }
}
