import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/stores/user/auth_store.dart';
import 'package:provider/provider.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthStore _store = context.read<AuthStore>();

    return Scaffold(
      appBar: AppBar(title: const Text('Personal')),
      body: Observer(builder: (_) {
        return Center(
          child: Observer(builder: (_) {
            if (_store.isLoggedIn) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Hello ${_store.user!.fullName}'),
                  ElevatedButton(
                    child: const Text('Logout'),
                    onPressed: () {
                      _store.removeAuth();
                    },
                  ),
                ],
              );
            }
            return Container();
          }),
        );
      }),
    );
  }
}
