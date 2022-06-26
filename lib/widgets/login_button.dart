import 'package:flutter/material.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/widgets/login_form.dart';

class LoginButton extends StatelessWidget {
  late String title;
  LoginButton({Key? key, this.title = 'Đăng nhập'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: const Key('login_button'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          AppColors.palette.shade500,
        ),
      ),
      child: Text(title),
      onPressed: () {
        ShowButtomSheetLogin(context);
      },
    );
  }
}

void ShowButtomSheetLogin(BuildContext context) {
  showModalBottomSheet<void>(
    // border top corner
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),

    // close button in top right corn

    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(child: const LoginForm()),
      );
    },
  );
}
