//
//  NSObject+MapViewModel.h
//  InternationalSpaceStation-Objc
//
//  Created by Difeng Chen on 9/25/22.
//

#import <Foundation/Foundation.h>
#import "MapDataManager.h"

@interface MapViewModel: NSObject

@property MapDataManager *dataManager;

- (void) fetchISSLocation: (void (^)(ISSLocationResponse * response)) successBlock onFailure: (void (^) (NSError *)) failureBlock;

@end
