import 'package:dio/dio.dart';
import 'package:fruity/data/network/apis/upload/upload_api.dart';
import 'package:fruity/data/network/apis/user/user_api.dart';
import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/upload/upload_request.dart';
import 'package:fruity/dto/upload/upload_response.dart';
import 'package:fruity/dto/user/user_request.dart';
import 'package:fruity/dto/user/user_response.dart';
import 'package:fruity/models/user/user.dart';
import 'package:mobx/mobx.dart';
part 'form_update_profile_store.g.dart';

class FormUpdateProfileStore = _FormUpdateProfileStoreBase
    with _$FormUpdateProfileStore;

abstract class _FormUpdateProfileStoreBase with Store {
  UploadAPI _uploadAPI = UploadAPI(
      DioClient(Dio(), contentType: "application/x-www-form-urlencoded"));

  UserAPI _userAPI = UserAPI(DioClient(Dio()));

  List<ReactionDisposer> _disposer = [];

  FormUpdateUserProfileValidation validation =
      FormUpdateUserProfileValidation();

  void setupListener() {
    _disposer.add(
      reaction(
        (_) => fullName,
        (String fullName) {
          if (fullName.isEmpty) {
            validation.setFullNameError('Họ và tên không được để trống');
          } else {
            validation.setFullNameError(null);
          }
        },
      ),
    );
  }

  @observable
  String? errorMessage;

  @observable
  bool isLoading = false;

  @observable
  bool isLoadingAvatar = false;

  @observable
  String fullName = '';
  @action
  void setFullName(String fullName) {
    this.fullName = fullName;
  }

  @observable
  String avatar = '';
  @action
  void setAvatar(String avatar) {
    this.avatar = avatar;
  }

  @observable
  String email = '';
  @action
  void setEmail(String email) {
    this.email = email;
  }

  @computed
  bool get isValid {
    return fullName.isNotEmpty && validation.fullNameError == null;
  }

  @action
  Future<void> uploadAvatar(String filePath) async {
    try {
      isLoadingAvatar = true;
      errorMessage = null;
      final UploadSingleResponse res =
          await _uploadAPI.uploadSingle(UploadSingleRequest(filePath));
      if (res.errorMessage == null) {
        setAvatar(res.link);
      } else {
        errorMessage = res.errorMessage;
      }
    } catch (e) {
      if (e is NetworkException) {
        errorMessage = e.message ?? 'Có lỗi xảy ra';
      } else {
        errorMessage = e.toString();
      }
    } finally {
      isLoadingAvatar = false;
    }
  }

  Future<User?> updateProfile() async {
    try {
      isLoading = true;
      errorMessage = null;
      UpdateProfileResponse res =
          await _userAPI.updateProfile(UpdateProfileRequest(
        fullName: fullName,
        email: email,
        avatar: avatar,
      ));
      if (res.errorMessage == null) {
        errorMessage = null;
      } else {
        errorMessage = res.errorMessage;
      }
      return res.user;
    } catch (e) {
      if (e is NetworkException) {
        errorMessage = e.message ?? 'Có lỗi xảy ra';
      } else {
        errorMessage = e.toString();
      }
      return null;
    } finally {
      isLoading = false;
    }
  }
}

class FormUpdateUserProfileValidation = _FormUpdateUserProfileValidationBase
    with _$FormUpdateUserProfileValidation;

abstract class _FormUpdateUserProfileValidationBase with Store {
  @observable
  String? fullNameError;
  @action
  setFullNameError(String? fullNameError) {
    this.fullNameError = fullNameError;
  }
}
