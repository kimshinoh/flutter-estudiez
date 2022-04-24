import 'package:fruity/utils/location_util.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

part 'location.g.dart';

class LocationStore = _LocationStoreBase with _$LocationStore;

abstract class _LocationStoreBase with Store {
  _LocationStoreBase() {
    updatePosition();
  }

  @action
  Future<void> updatePosition() async {
    final Position position = await LocationHelper.myLocation();
    this.position = position;
  }

  @computed
  Future<String> get addressStr async {
    return "";
  }

  @observable
  Position position = Position(
      longitude: 0.0,
      latitude: 0.0,
      timestamp: DateTime.now(),
      accuracy: 0.0,
      altitude: 0.0,
      heading: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0);
}
