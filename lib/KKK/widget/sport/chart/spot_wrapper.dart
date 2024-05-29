import 'package:fl_chart/fl_chart.dart';

///对数据点进行 封装扩张
class SpotWrapper extends FlSpot {
  final bool hasEvent; //是否有事件
  final int eventType; //事件类型
  final bool addNew; //是否显示 ➕
  SpotWrapper(super.x, super.y, this.hasEvent, this.eventType, this.addNew);

  factory SpotWrapper.simple({
    required x,
    required y,
    bool? hasEvent = false,
    int? eventType = 0,
    bool? addNew = false,
  }) {
    return SpotWrapper(x, y, hasEvent!, eventType!, addNew!);
  }

  factory SpotWrapper.copyWith(
    FlSpot flSpot, {
    bool? hasEvent = false,
    int? eventType = 0,
    bool? addNew = false,
  }) {
    return SpotWrapper(flSpot.x, flSpot.y, hasEvent!, eventType!, addNew!);
  }
}
