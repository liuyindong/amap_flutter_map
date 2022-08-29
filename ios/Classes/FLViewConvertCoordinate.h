//
//  FLViewConvertCoordinate.h
//  Map
//
//  Created by forter on 2022/8/29.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@class MAMapView;

@interface FLViewConvertCoordinateModel : NSObject

@property CLLocationCoordinate2D topLeft;
@property CLLocationCoordinate2D topRight;
@property CLLocationCoordinate2D bottomLeft;
@property CLLocationCoordinate2D bottomRight;

@end


NS_ASSUME_NONNULL_BEGIN

@interface FLViewConvertCoordinate : NSObject

+ (FLViewConvertCoordinateModel *)viewConvertCoordinate:(MAMapView *)mapView;

@end

NS_ASSUME_NONNULL_END

