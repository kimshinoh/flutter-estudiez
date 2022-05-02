import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/models/user/user.dart';
import 'package:fruity/routes.dart';
import 'package:fruity/stores/user/auth_store.dart';
import 'package:fruity/widgets/login_button.dart';
import 'package:provider/provider.dart';

AppBar PersonalAppBar() {
  return AppBar(
    toolbarHeight: 100, // Set this height
    title: Builder(
      builder: (BuildContext context) {
        AuthStore _store = context.read<AuthStore>();
        return Observer(builder: (_) {
          if (!_store.isLoggedIn) {
            return TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  ShowButtomSheetLogin(context);
                },
                child: Text(
                  "Đăng ký/Đăng nhập",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ));
          }

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
                  UserAvatar(),
                  const SizedBox(
                    width: 10,
                  ),
                  const UserTextInfo()
                ],
              ),
            ),
          );
        });
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
  UserAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthStore _store = context.read<AuthStore>();

    return Observer(
      builder: (_) {
        User? user = _store.user;
        if (_store.isLoggedIn && user != null) {
          return Avatar(
            imageUrl: user.avatar,
          );
        }

        return Container();
      },
    );
  }
}

class Avatar extends StatelessWidget {
  String imageUrl;
  Size size;
  Avatar({Key? key, required this.imageUrl, this.size = const Size(60, 60)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
        ),
        image: DecorationImage(
          image: NetworkImage(imageUrl.isNotEmpty
              ? imageUrl
              : 'https://i.imgur.com/EYdQnGt.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
