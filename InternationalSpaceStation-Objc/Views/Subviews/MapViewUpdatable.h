//
//  MapViewUpdatable.h
//  InternationalSpaceStation-Objc
//
//  Created by Difeng Chen on 9/24/22.
//

#import <Foundation/Foundation.h>
#import "ISSLocationResponse.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MapViewUpdatable <NSObject>

- (void) updateLocation: (ISSLocationResponse*) response;

@end

NS_ASSUME_NONNULL_END
