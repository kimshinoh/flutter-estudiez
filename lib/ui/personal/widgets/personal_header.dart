import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/routes.dart';
import 'package:fruity/stores/user/auth_store.dart';
import 'package:provider/provider.dart';

AppBar PersonalAppBar() {
  return AppBar(
    toolbarHeight: 100, // Set this height
    title: Builder(
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.user_profile,
            );
          },
          child: SizedBox(
            child: Row(
              children: [
                const UserAvatar(),
                const SizedBox(
                  width: 10,
                ),
                const UserTextInfo()
              ],
            ),
          ),
        );
      },
    ),
  );
}

class UserTextInfo extends StatelessWidget {
  const UserTextInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthStore _store = context.read<AuthStore>();

    return Observer(
      builder: (_) {
        if (!_store.isLoggedIn) {
          return Container();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _store.user!.fullName,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              _store.user!.phoneNumber,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        );
      },
    );
  }
}

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthStore _store = context.read<AuthStore>();

    return Observer(
      builder: (_) {
        if (_store.isLoggedIn) {
          return Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
              ),
              image: DecorationImage(
                image: NetworkImage(_store.user!.avatarUrl),
                fit: BoxFit.cover,
              ),
            ),
          );
        }

        return Container();
      },
    );
  }
}
