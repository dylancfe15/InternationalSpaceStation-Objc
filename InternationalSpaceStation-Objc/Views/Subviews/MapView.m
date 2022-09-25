//
//  MapView.m
//  InternationalSpaceStation-Objc
//
//  Created by Difeng Chen on 9/22/22.
//

#import "MapView.h"

@implementation MapView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame: frame];

    if (self) {
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.delegate = self;

        _annotation = [MKPointAnnotation alloc];
        _annotation.title = @"International Space Station";

        [self addAnnotation: _annotation];
    }

    return self;
}

- (instancetype) initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder: coder];

    return self;
}

- (void) updateLocation:(nonnull ISSLocationResponse *)response {
    double latitude = [response.latitude doubleValue];
    double longitude = [response.longitude doubleValue];

    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);

    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration: 3 animations:^{
            __weak typeof(self) weakSelf = self;

            weakSelf.annotation.coordinate = coordinate;
        }];
    });
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    NSString *reuseIdentifier = @"space_station";
    MKAnnotationView *annotationView;

    if ([self dequeueReusableAnnotationViewWithIdentifier:reuseIdentifier]) {
        annotationView = [self dequeueReusableAnnotationViewWithIdentifier:reuseIdentifier];
        annotationView.annotation = annotation;
    } else {
        annotationView = [[MKAnnotationView alloc]
                          initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    }

    if (annotationView) {
        annotationView.canShowCallout = true;
        annotationView.image = [UIImage imageNamed: @"space_station"];
    }

    [annotationView setFrame:CGRectMake(0, 0, 35, 35)];

    return annotationView;
}

@end
