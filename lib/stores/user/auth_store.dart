import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruity/data/network/apis/user/auth.api.dart';
import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/user/user_request.dart';
import 'package:fruity/dto/user/user_response.dart';
import 'package:fruity/models/user/user.dart' as UserModel;
import 'package:fruity/stores/payment/payment_store.dart';
import 'package:fruity/stores/user/form_login_store.dart';
import 'package:fruity/stores/user_address/user_address_store.dart';
import 'package:fruity/utils/fcm.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late SharedPreferences _prefs;

  final List<ReactionDisposer> _disposers = [];

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

  UserAddressStore userAddressStore = UserAddressStore();
  PaymentStore paymentStore = PaymentStore();

  void setupUpdateUser() {
    _disposers.add(
      reaction(
        (_) => userId,
        (String userId) {
          if (userId.isNotEmpty) {
            paymentStore.getMyPayments();
            userAddressStore.getUserAddresses();
            FCMService.updateToken();
          } else {
            paymentStore.clearPayments();
            userAddressStore.clearUserAddresses();
          }
        },
      ),
    );
  }

  @observable
  UserModel.User? user;

  @observable
  String? token;

  @observable
  int? expiredAt;

  @observable
  String verificationId = '';
  @observable
  bool isLoading = false;

  @observable
  bool isLoadingSentCode = false;

  @observable
  bool isLoggedIn = false;

  @observable
  String errorMessage = '';

  @observable
  bool isSuccess = false;

  @action
  setUser(UserModel.User user) async {
    this.user = user;
    user.saveToPrefs(_prefs);
  }

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
    formLoginStore.clear();
  }

  void removeAuth() {
    user = null;
    token = null;
    expiredAt = null;
    isLoggedIn = false;
    isSuccess = false;

    UserLoginResponseDTO.clearPrefs(_prefs);
    formLoginStore.clear();
  }

  @computed
  String get userId {
    return user?.id ?? '';
  }

  @computed
  bool get canLogin => getCanLogin();

  bool get canVerify => getCanVerify();
  bool getCanLogin() {
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      return true;
    }
    return formLoginStore.phoneNumber.isNotEmpty &&
        formLoginStore.smsCode.isNotEmpty &&
        !formLoginStore.formErrorStore.hasErrorsInLogin &&
        verificationId.isNotEmpty &&
        !isLoading;
  }

  bool getCanVerify() {
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      return true;
    }
    return formLoginStore.phoneNumber.isNotEmpty &&
        !formLoginStore.formErrorStore.hasErrorsInVerify &&
        !isLoading;
  }

  @action
  void cleanState() {
    isLoading = false;
    isSuccess = false;
    errorMessage = '';
  }

  @action
  Future<void> handleRequestOTP() async {
    cleanState();
    isLoadingSentCode = true;
    await _auth
        .verifyPhoneNumber(
      phoneNumber: formLoginStore.transformPhoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        try {
          isLoading = true;
          await handleLogin(credential);
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
          print(errorMessage);
          isLoading = false;
        }
      },
      codeAutoRetrievalTimeout: (String codeAutoRetrievalTimeout) {
        verificationId = verificationId;
        isLoadingSentCode = false;
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        this.verificationId = verificationId;
        isLoadingSentCode = false;
      },
      verificationFailed: (FirebaseAuthException error) {
        if (error.message != null) {
          errorMessage = error.message!;
        } else {
          errorMessage = error.toString();
        }
      },
    )
        .catchError((err) {
      errorMessage = err.toString();
    });
  }

  @action
  Future<void> handleVerifyOTP() async {
    cleanState();

    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: formLoginStore.smsCode,
    );

    try {
      isLoading = true;
      await handleLogin(credential);
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

  @action
  Future<void> handleLogin(AuthCredential credential) async {
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
  }
}
