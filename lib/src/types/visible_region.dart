import 'package:amap_flutter_base/amap_flutter_base.dart';

/// 地图覆盖物基类
class VisibleRegion {
  /// overlay id
  late LatLng _nearLeft;
  late LatLng _nearRight;
  late LatLng _farLeft;
  late LatLng _farRight;
  late LatLngBounds _latLngBounds;

  LatLng get nearLeft => _nearLeft;
  LatLng get nearRight => _nearRight;
  LatLng get farLeft => _farLeft;
  LatLng get farRight => _farRight;
  LatLngBounds get latLngBounds => _latLngBounds;


}
