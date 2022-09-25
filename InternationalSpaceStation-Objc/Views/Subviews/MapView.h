//
//  MapView.h
//  InternationalSpaceStation-Objc
//
//  Created by Difeng Chen on 9/22/22.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "MapViewUpdatable.h"
#import "ISSLocationResponse.h"

@interface MapView: MKMapView<MapViewUpdatable, MKMapViewDelegate>

@property MKPointAnnotation *annotation;

@end

