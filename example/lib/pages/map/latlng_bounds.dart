import 'dart:typed_data';

import 'package:amap_flutter_map_example/base_page.dart';
import 'package:amap_flutter_map_example/const_config.dart';
import 'package:flutter/material.dart';

import 'package:amap_flutter_map/amap_flutter_map.dart';

import '../../widgets/amap_radio_group.dart';

class LatLngBound extends BasePage {
  LatLngBound(String title, String subTitle) : super(title, subTitle);
  @override
  Widget build(BuildContext context) {
    return _LatLngBoundBody();
  }
}

class _LatLngBoundBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LatLngBoundState();
}

class _LatLngBoundState extends State<_LatLngBoundBody> {
  List<Widget> _approvalNumberWidget = <Widget>[];
  @override
  Widget build(BuildContext context) {
    final AMapWidget map = AMapWidget(
      apiKey: ConstConfig.amapApiKeys,
      onMapCreated: onMapCreated,
    );
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: map,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 500, bottom: 10),
            child: SizedBox(
              height: 40,
              width: 100,
              child: TextButton(
                child: Text('获取边界'),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  //文字颜色
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  //水波纹颜色
                  overlayColor: MaterialStateProperty.all(Colors.blueAccent),
                  //背景颜色
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    //设置按下时的背景颜色
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.blueAccent;
                    }
                    //默认背景颜色
                    return Colors.blue;
                  }),
                ),
                onPressed: () async {
                  Map? imageBytes = await _mapController.getLatLngBounds();
                  print(imageBytes);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  late AMapController _mapController;
  void onMapCreated(AMapController controller) {
    setState(() {
      _mapController = controller;
      getApprovalNumber();
    });
  }

  /// 获取审图号
  void getApprovalNumber() async {
    //普通地图审图号
    String mapContentApprovalNumber =
      (await _mapController.getMapContentApprovalNumber())!;
    //卫星地图审图号
    String satelliteImageApprovalNumber =
      (await _mapController.getSatelliteImageApprovalNumber())!;
    setState(() {
        _approvalNumberWidget.add(Text(mapContentApprovalNumber));
        _approvalNumberWidget.add(Text(satelliteImageApprovalNumber));
    });
    print('地图审图号（普通地图）: $mapContentApprovalNumber');
    print('地图审图号（卫星地图): $satelliteImageApprovalNumber');
  }
}
