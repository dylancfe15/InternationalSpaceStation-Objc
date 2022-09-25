//
//  MapViewController.m
//  InternationalSpaceStation-Objc
//
//  Created by Difeng Chen on 9/21/22.
//

#import "MapViewController.h"

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configureUI];
}

- (void)configureUI {
    _mapView = [[MapView alloc] init];

    [self.view addSubview: _mapView];

    [NSLayoutConstraint activateConstraints: @[
        [_mapView.topAnchor constraintEqualToAnchor: self.view.topAnchor],
        [_mapView.leadingAnchor constraintEqualToAnchor: self.view.leadingAnchor],
        [_mapView.bottomAnchor constraintEqualToAnchor: self.view.bottomAnchor],
        [_mapView.trailingAnchor constraintEqualToAnchor: self.view.trailingAnchor]
    ]];
}

@end
