//
//  MapViewModel.m
//  InternationalSpaceStation-Objc
//
//  Created by Difeng Chen on 9/25/22.
//

#import "MapViewModel.h"
#import "MapDataManager.h"

@implementation MapViewModel

- (void) fetchISSLocation:(void (^)(ISSLocationResponse *))successBlock onFailure:(void (^)(NSError *))failureBlock {
    _dataManager = [MapDataManager alloc];

    [_dataManager fetchISSLocation:successBlock onFailure:failureBlock];
}

@end
