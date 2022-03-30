import 'package:mobx/mobx.dart';
part 'user_store.g.dart';

class User = _UserBase with _$User;

abstract class _UserBase with Store {
  @observable
  late String phoneNumber;
  @observable
  late String idToken;

  


  @action
  void setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }

  @action
  void setIdToken(String idToken) {
    this.idToken = idToken;
  }
}
