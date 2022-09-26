//
//  MapViewController.m
//  InternationalSpaceStation-Objc
//
//  Created by Difeng Chen on 9/21/22.
//

#import "MapViewController.h"
#import "MapViewModel.h"
#import <UIKit/UIKit.h>

@implementation MapViewController

MapViewModel *viewModel;
UIButton *focusButton;

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configureUI];

    viewModel = [MapViewModel alloc];

    [viewModel fetchISSLocationRepeatly:^(ISSLocationResponse *response) {
        [self.mapView updateLocation:response];
    } onFailure:^(NSError *error) {
        // TODO: Handle error
    }];
}

- (void)configureUI {
    // MapView
    _mapView = [[MapView alloc] init];

    // FocusButton
    focusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    focusButton.translatesAutoresizingMaskIntoConstraints = false;
    [focusButton setImage:[UIImage imageNamed:@"focus"] forState:(UIControlStateNormal)];
    focusButton.backgroundColor = [UIColor whiteColor];
    focusButton.layer.shadowRadius = 5;
    focusButton.layer.shadowColor = [[UIColor grayColor] CGColor];
    focusButton.layer.shadowRadius = 10;
    [focusButton addTarget:self action:@selector(didFocusButtonOnTap:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview: _mapView];
    [self.view addSubview: focusButton];

    [NSLayoutConstraint activateConstraints: @[
        [_mapView.topAnchor constraintEqualToAnchor: self.view.topAnchor],
        [_mapView.leadingAnchor constraintEqualToAnchor: self.view.leadingAnchor],
        [_mapView.bottomAnchor constraintEqualToAnchor: self.view.bottomAnchor],
        [_mapView.trailingAnchor constraintEqualToAnchor: self.view.trailingAnchor],

        [focusButton.widthAnchor constraintEqualToConstant:44],
        [focusButton.heightAnchor constraintEqualToConstant:44],
        [focusButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-75],
        [focusButton.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-16]
    ]];
}

- (void) didFocusButtonOnTap:(id)sender {
    _mapView.shouldFocusOnISS = !_mapView.shouldFocusOnISS;

    focusButton.alpha = _mapView.shouldFocusOnISS ? 1 : 0.5;
}

@end
