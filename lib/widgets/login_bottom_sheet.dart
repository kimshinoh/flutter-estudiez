import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/stores/user/auth_store.dart';
import 'package:fruity/widgets/login_button.dart';
import 'package:provider/provider.dart';

class LoginBottomSheet extends StatelessWidget {
  const LoginBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthStore _store = context.read<AuthStore>();

    final double fullHeight = MediaQuery.of(context).size.height;
    return Observer(
      builder: (_) {
        if (_store.isLoggedIn) {
          return Container();
        }
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: MediaQuery.of(context).size.width * 0.95,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const Text(
                    'Đăng nhập ngay để nhận nhiều ưu đãi hơn',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                LoginButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}
