import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/stores/user/auth_store.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class LoginBottomSheet extends StatelessWidget {
  const LoginBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fullHeight = MediaQuery.of(context).size.height;
    final fullWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(bottom: 5),
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text("Đăng nhập ngay để nhận nhiều ưu đãi hơn",
                style: TextStyle(color: Colors.white, fontSize: 14)),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.palette.shade500),
            ),
            child: const Text('Đăng nhập'),
            onPressed: () {
              showModalBottomSheet<void>(
                // border top corner
                shape: RoundedRectangleBorder(
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
                      child: Container(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            height: fullHeight * 0.5,
                            child: _formLogin(),
                          ),
                        ],
                      )));
                },
              );
            },
          ),
        ]),
      ),
    );
  }
}

class _formLogin extends StatefulWidget {
  _formLogin({Key? key}) : super(key: key);

  @override
  State<_formLogin> createState() => _formLoginState();
}

class _formLoginState extends State<_formLogin> {
  TextEditingController _phoneController = TextEditingController();

  TextEditingController _secureCodeController = TextEditingController();

  late AuthStore _store;
  late List<ReactionDisposer> _disposers;
  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
    _secureCodeController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _store = context.read<AuthStore>();
    _store.formLoginStore.setupValidations();

    _disposers = [
      reaction((_) => _store.errorMessage, (_) {
        if (_store.errorMessage.isNotEmpty) {
          FlushbarHelper.createError(
            message: _store.errorMessage,
            title: 'Lỗi',
            duration: const Duration(seconds: 2),
          ).show(context);
        }
      }),
      reaction((_) => _store.isSuccess, (_) {
        if (_store.isSuccess) {
          FlushbarHelper.createSuccess(
            message: "Đăng nhập thành công",
            duration: const Duration(seconds: 2),
          ).show(context);
        }
      }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final fullWidth = MediaQuery.of(context).size.width;

    return ListView(children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Text(
          'Đăng nhập',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        width: fullWidth,
        margin: EdgeInsets.only(top: 20, left: 30, right: 30),
        child: Observer(builder: (_) {
          return Column(children: [
            Container(
              width: fullWidth,
              child: Text(
                'Lần đầu đăng nhập tự động đăng ký',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            TextField(
                maxLength: 10,
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                autofocus: false,
                onChanged: (_) {
                  _store.formLoginStore.setPhoneNumber(_phoneController.text);
                },
                decoration: InputDecoration(
                  errorText: _store.formLoginStore.formErrorStore.phoneNumber,
                  counterText: "",
                  labelText: 'Số điện thoại',
                  labelStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                )),
            TextField(
                maxLength: 6,
                controller: _secureCodeController,
                keyboardType: TextInputType.phone,
                autofocus: false,
                onChanged: (_) {
                  _store.formLoginStore.setSMSCode(_secureCodeController.text);
                },
                decoration: InputDecoration(
                    errorText: _store.formLoginStore.formErrorStore.smsCode,
                    counterText: "",
                    labelText: 'Mã xác minh',
                    labelStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    suffixStyle: TextStyle(fontSize: 12),
                    suffixIconConstraints: BoxConstraints(
                      minWidth: 0,
                      minHeight: 0,
                    ),
                    suffixIcon: OutlinedButton(
                      onPressed: () {
                        if (_store.canVerify) {
                          _store.handleRequestOTP();
                        }
                      },
                      child: Text('Gửi mã'),
                      style: OutlinedButton.styleFrom(
                          primary: _store.canVerify
                              ? AppColors.palette.shade500
                              : Colors.grey.shade500,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          side: BorderSide(
                              width: 1.0,
                              color: _store.canVerify
                                  ? AppColors.palette.shade500
                                  : Colors.grey.shade500),
                          textStyle: TextStyle(
                            color: _store.canVerify
                                ? AppColors.palette.shade500
                                : Colors.grey.shade500,
                            fontSize: 12,
                          ),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          padding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15)),
                    ))),
            SizedBox(height: 10),
            Observer(builder: (_) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: _store.canLogin
                      ? AppColors.palette.shade500
                      : Colors.grey.shade500,
                  minimumSize: Size.fromHeight(
                      30), // fromHeight use double.infinity as width and 40 is the height
                ),
                onPressed: () {
                  _store.handleVerifyOTP();
                },
                child: _store.isLoading
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Text('Đăng nhập',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
              );
            }),
            Container(
              width: fullWidth,
              child: Text(
                'Bằng việc đăng nhập, bạn đồng ý với các điều khoản của chúng tôi',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ]);
        }),
      )
    ]);
  }
}
