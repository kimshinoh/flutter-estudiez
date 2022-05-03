import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/stores/user/auth_store.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthStore _store = context.read<AuthStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt'),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          if (_store.isLoggedIn) {
            return Align(
              alignment: Alignment.bottomLeft,
              child: TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            title: const Text('Đăng xuất'),
                            content:
                                const Text('Bạn có chắc chắn muốn đăng xuất?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Hủy',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  _store.removeAuth();
                                  Future.delayed(Duration.zero, () {
                                    Navigator.pop(context);
                                  });

                                  Navigator.pop(context);
                                },
                                child: const Text('Đăng xuất'),
                              ),
                            ],
                          ));
                },
                child: Row(
                  children: const [
                    Icon(Icons.exit_to_app),
                    SizedBox(width: 10),
                    Text('Đăng xuất'),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
