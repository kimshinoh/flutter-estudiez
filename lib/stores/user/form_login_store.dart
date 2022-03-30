import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruity/data/network/apis/user/auth.api.dart';
import 'package:fruity/data/network/rest_client.dart';
import 'package:fruity/dto/user/user_request.dart';
import 'package:fruity/dto/user/user_response.dart';
import 'package:mobx/mobx.dart';

part 'form_login_store.g.dart';

class FormLoginStore = _FormLoginStoreBase with _$FormLoginStore;

abstract class _FormLoginStoreBase with Store {
  FirebaseAuth auth = FirebaseAuth.instance;
  AuthAPI authApi = AuthAPI(
    RestClient(),
  );

  @observable
  late String phoneNumber = '';
  @observable
  late String idToken = '';
  @observable
  late String verificationId = '';

  @observable
  late String? phoneNumberError = null;

  @action
  void setPhoneNumber(String phoneNumber) {
    this.phoneNumberError = null;
    this.phoneNumber = phoneNumber;

    if (phoneNumber.length < 10) {
      this.phoneNumberError = 'Số điện thoại không hợp lệ';
    }
  }

  @computed
  String get transformPhoneNumber => '+84${phoneNumber.substring(1)}';

  @action
  Future<void> handleRequestOTP() async {
    if (this.phoneNumberError != null || this.phoneNumber.length < 10) {
      return;
    }

    await auth.verifyPhoneNumber(
        phoneNumber: transformPhoneNumber,
        timeout: Duration(seconds: 60),
        verificationCompleted: (credential) async {
          await auth.signInWithCredential(credential);
          final User user = FirebaseAuth.instance.currentUser!;
          await user.getIdToken().then((String value) {
            idToken = value;
          });
          await authApi.login(
              UserLoginRequestDTO(phoneNumber: phoneNumber, idToken: idToken));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        codeSent: (String verificationId, int? forceResendingToken) async {
          this.verificationId = verificationId;
        },
        verificationFailed: (FirebaseAuthException error) {
          print(error.message);
        });
  }

  @action
  Future<void> handleVerifyOTP(String otp) async {
    if (this.verificationId == '') {
      return;
    }

    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );

    await auth.signInWithCredential(credential);
    final User user = FirebaseAuth.instance.currentUser!;
    await user.getIdToken().then((String value) {
      idToken = value;
    });

    UserLoginResponseDTO res = await authApi
        .login(UserLoginRequestDTO(phoneNumber: phoneNumber, idToken: idToken));
    if (res.error != null) {
      print(res.error);
    }
  }
}
