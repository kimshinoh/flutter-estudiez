import 'package:fruity/models/user/user.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  @observable
  late User user;
  @observable
  late String token;
  @observable
  late int expiredAt;

  @action
  void setUser(User user) {
    this.user = user;
  }

  @action
  void setToken(String token) {
    this.token = token;
  }

  @action
  void setExpired(int expiredAt) {
    this.expiredAt = expiredAt;
  }
}
