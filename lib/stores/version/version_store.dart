import 'package:mobx/mobx.dart';
import 'package:package_info_plus/package_info_plus.dart';
part 'version_store.g.dart';

class VersionStore = _VersionStoreBase with _$VersionStore;

abstract class _VersionStoreBase with Store {
  @observable
  String version = '1.0.0';

  @observable
  String buildNumber = '1';

  @action
  Future<void> init() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
  }
}
