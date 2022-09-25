//
//  MapDataManaging.h
//  InternationalSpaceStation-Objc
//
//  Created by Difeng Chen on 9/25/22.
//

#import <Foundation/Foundation.h>
#import "ISSLocationResponse.h"

@protocol MapDataManaging <NSObject>

- (void) fetchISSLocation: (void (^)(ISSLocationResponse *response)) successBlock onFailure: (void (^)(NSError *)) failureBlock;

@end
