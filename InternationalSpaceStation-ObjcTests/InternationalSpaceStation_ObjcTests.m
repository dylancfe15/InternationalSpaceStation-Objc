//
//  InternationalSpaceStation_ObjcTests.m
//  InternationalSpaceStation-ObjcTests
//
//  Created by Difeng Chen on 9/21/22.
//

#import <XCTest/XCTest.h>
#import "MapViewModel.h"
#import "MockMapDataManager.h"

@interface InternationalSpaceStation_ObjcTests : XCTestCase

@end

@implementation InternationalSpaceStation_ObjcTests

MapViewModel *viewModel;
XCTestExpectation *expectation;

- (void)setUp {
    viewModel = [MapViewModel alloc];
    viewModel.dataManager = (MapDataManager*)[MockMapDataManager alloc];
}

- (void)tearDown {
    viewModel = nil;
}

- (void) testFetchISSLocation {
    expectation = [self expectationWithDescription:@"expectation"];

    [viewModel fetchISSLocation:^(ISSLocationResponse *response) {
        XCTAssertNotNil(response);

        [expectation fulfill];
    } onFailure:^(NSError *error) {

    }];

    [self waitForExpectationsWithTimeout:3 handler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

@end
