//
//  MapViewModel.m
//  InternationalSpaceStation-Objc
//
//  Created by Difeng Chen on 9/25/22.
//

#import "MapViewModel.h"
#import "MapDataManager.h"

@implementation MapViewModel

- (void) fetchISSLocationRepeatly: (void (^)(ISSLocationResponse *response)) successBlock onFailure: (void (^) (NSError *)) failureBlock {
    [NSTimer scheduledTimerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
        __weak typeof(self) weakSelf = self;

        [weakSelf fetchISSLocation:successBlock onFailure:failureBlock];
    }];
}

- (void) fetchISSLocation:(void (^)(ISSLocationResponse *))successBlock onFailure:(void (^)(NSError *))failureBlock {
    _dataManager = [MapDataManager alloc];

    [_dataManager fetchISSLocation:successBlock onFailure:failureBlock];
}

@end
