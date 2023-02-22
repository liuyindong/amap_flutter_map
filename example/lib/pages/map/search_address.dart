import 'package:amap_flutter_map_example/base_page.dart';
import 'package:amap_flutter_map_example/const_config.dart';
import 'package:flutter/material.dart';

import 'package:amap_flutter_map/amap_flutter_map.dart';


class SearchAddress extends BasePage {
  SearchAddress(String title, String subTitle) : super(title, subTitle);
  @override
  Widget build(BuildContext context) {
    return _SearchAddressBody();
  }
}

class _SearchAddressBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchAddressState();
}

class _SearchAddressState extends State<_SearchAddressBody> {
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
          TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) => Colors.orange,
                          ),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          )),
                        ),
                        onPressed: () async {
                          Map? imageBytes = await _mapController.searchAddress("坂田微谷");
                          print(imageBytes);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            '搜索',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        )),
                    SizedBox(
                      height: 40,
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
