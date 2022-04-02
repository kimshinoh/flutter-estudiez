import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruity/data/network/apis/user/auth.api.dart';
import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/user/user_request.dart';
import 'package:fruity/dto/user/user_response.dart';
import 'package:fruity/models/user/user.dart' as UserModel;
import 'package:fruity/stores/user/form_login_store.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late SharedPreferences _prefs;
  _AuthStoreBase() {
    init();
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  final AuthAPI _authAPI = AuthAPI(
    DioClient(Dio()),
  );

  FormLoginStore formLoginStore = FormLoginStore();

  @observable
  late UserModel.User? user;

  @observable
  late String? token;

  @observable
  late int? expiredAt;

  @observable
  String verificationId = '';
  @observable
  bool isLoading = false;

  @observable
  bool isLoggedIn = false;

  @observable
  bool isVerified = false;

  @observable
  String errorMessage = '';

  @observable
  bool isSuccess = false;

  @action
  void setErrorMessage(String errorMessage) {
    this.errorMessage = errorMessage;
  }

  @action
  void setAuth(UserLoginResponseDTO res) {
    user = res.user;
    token = res.token;
    expiredAt = res.expiredAt;
    isLoggedIn = true;
    isSuccess = true;
    res.saveToPrefs(_prefs);
  }

  void removeAuth() {
    user = null;
    token = null;
    expiredAt = null;
    isLoggedIn = false;
    isSuccess = false;

    UserLoginResponseDTO.clearPrefs(_prefs);
  }

  @computed
  bool get canLogin =>
      formLoginStore.phoneNumber.isNotEmpty &&
      formLoginStore.smsCode.isNotEmpty &&
      !formLoginStore.formErrorStore.hasErrorsInLogin &&
      verificationId.isNotEmpty;

  bool get canVerify =>
      formLoginStore.phoneNumber.isNotEmpty &&
      !formLoginStore.formErrorStore.hasErrorsInVerify;

  @action
  Future<void> handleRequestOTP() async {
    errorMessage = '';
    isSuccess = false;
    await _auth.verifyPhoneNumber(
      phoneNumber: formLoginStore.transformPhoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        try {
          isLoading = true;
          await _auth.signInWithCredential(credential);
          final User user = FirebaseAuth.instance.currentUser!;
          final String idToken = await user.getIdToken();
          final UserLoginResponseDTO res = await _authAPI.login(
            UserLoginRequestDTO(
              phoneNumber: formLoginStore.phoneNumber,
              idToken: idToken,
            ),
          );

          if (res.error != null) {
            errorMessage = res.error!;
            return;
          }
          setAuth(res);
        } on FirebaseException catch (e) {
          if (e.message != null) {
            errorMessage = e.message!;
          } else {
            errorMessage = e.toString();
          }
        } on NetworkException catch (e) {
          if (e.message != null) {
            errorMessage = e.message!;
          } else {
            errorMessage = e.toString();
          }
        } finally {
          isLoading = false;
        }
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      codeSent: (String verificationId, int? forceResendingToken) {
        this.verificationId = verificationId;
      },
      verificationFailed: (FirebaseAuthException error) {
        if (error.message != null) {
          errorMessage = error.message!;
        } else {
          errorMessage = error.toString();
        }
      },
    );
  }

  @action
  Future<void> handleVerifyOTP() async {
    errorMessage = '';
    isSuccess = false;

    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: formLoginStore.smsCode,
    );

    try {
      isLoading = true;
      await _auth.signInWithCredential(credential);

      final User user = FirebaseAuth.instance.currentUser!;
      final String idToken = await user.getIdToken();

      final UserLoginResponseDTO res = await _authAPI.login(
        UserLoginRequestDTO(
          phoneNumber: formLoginStore.phoneNumber,
          idToken: idToken,
        ),
      );

      if (res.error != null) {
        errorMessage = res.error!;
        return;
      }
      setAuth(res);
    } on FirebaseAuthException catch (e) {
      if (e.message != null) {
        errorMessage = e.message!;
      } else {
        errorMessage = 'Có lỗi xảy ra';
      }
    } on NetworkException catch (e) {
      if (e.message != null) {
        errorMessage = e.message!;
      } else {
        errorMessage = 'Có lỗi xảy ra';
      }
    } finally {
      isLoading = false;
    }
  }
}
