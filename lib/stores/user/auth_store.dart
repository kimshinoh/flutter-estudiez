import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruity/data/network/apis/user/auth.api.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/data/network/rest_client.dart';
import 'package:fruity/dto/user/user_request.dart';
import 'package:fruity/dto/user/user_response.dart';
import 'package:fruity/models/user/user.dart' as UserModel;
import 'package:fruity/stores/user/form_login_store.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  FirebaseAuth _auth = FirebaseAuth.instance;
  AuthAPI _authAPI = AuthAPI(
    RestClient(),
  );

  FormLoginStore formLoginStore = FormLoginStore();

  @observable
  late UserModel.User? user = null;

  @observable
  late String? token = null;

  @observable
  late int? expiredAt = null;

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

  void setupValidations() {}

  @action
  void setUser(UserModel.User user) {
    this.user = user;
  }

  @action
  setErrorMessage(String errorMessage) {
    this.errorMessage = errorMessage;
  }

  @action
  void setToken(String token) {
    this.token = token;
  }

  @action
  void setExpired(int expiredAt) {
    this.expiredAt = expiredAt;
  }

  @action
  setAuth(UserLoginResponseDTO res) {
    setUser(res.user!);
    setToken(res.token!);
    setExpired(res.expiredAt!);
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
      verificationCompleted: (credential) async {
        try {
          isLoading = true;
          await _auth.signInWithCredential(credential);
          final User user = FirebaseAuth.instance.currentUser!;
          String idToken = await user.getIdToken();
          UserLoginResponseDTO res = await _authAPI.login(
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
          isLoggedIn = true;
          isSuccess = true;
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

      final UserLoginResponseDTO res = await _authAPI.login(UserLoginRequestDTO(
        phoneNumber: formLoginStore.phoneNumber,
        idToken: idToken,
      ));

      if (res.error != null) {
        errorMessage = res.error!;
        return;
      }
      setAuth(res);
      isLoggedIn = true;
      isSuccess = true;
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