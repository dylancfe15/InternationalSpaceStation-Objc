//
//  MockMapDataManager.h
//  InternationalSpaceStation-ObjcTests
//
//  Created by Difeng Chen on 9/25/22.
//

#import <Foundation/Foundation.h>
#import "MapDataManaging.h"

@interface MockMapDataManager : NSObject<MapDataManaging>

- (void) fetchISSLocation: (void (^)(ISSLocationResponse *response)) successBlock onFailure: (void (^)(NSError *)) failureBlock;

@end
