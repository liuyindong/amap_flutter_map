//
//  AMapViewController.h
//  amap_flutter_map
//
//  Created by lly on 2020/10/29.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <MAMapKit/MAMapKit.h>
@class MAMapView;

@interface AMapViewController : NSObject

@property CLLocationCoordinate2D topLeft;
@property CLLocationCoordinate2D topRight;
@property CLLocationCoordinate2D bottomLeft;
@property CLLocationCoordinate2D bottomRight;

@end



NS_ASSUME_NONNULL_BEGIN

@interface AMapViewController : NSObject<FlutterPlatformView>

- (instancetype)initWithFrame:(CGRect)frame
               viewIdentifier:(int64_t)viewId
                    arguments:(id _Nullable)args
                    registrar:(NSObject<FlutterPluginRegistrar>*)registrar;

+ (AMapViewController *)viewConvertCoordinate:(MAMapView *)mapView;

@endviewConvertCoordinate

NS_ASSUME_NONNULL_END
