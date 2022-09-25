//
//  ISSLocationResponse.m
//  InternationalSpaceStation-Objc
//
//  Created by Difeng Chen on 9/24/22.
//

#import "ISSLocationResponse.h"

@implementation ISSLocationResponse

- (id) initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];

    if (self) {
        NSString *message = [dictionary objectForKey: @"message"];
        NSNumber *timestamp = [dictionary objectForKey: @"timestamp"];
        NSDictionary *position = [dictionary objectForKey: @"iss_position"];
        NSString *latitude = [position objectForKey: @"latitude"];
        NSString *longitude = [position objectForKey: @"longitude"];

        if (message) {
            self.message = message;
        }

        if (timestamp) {
            self.timestamp = timestamp;
        }

        if (latitude) {
            self.latitude = latitude;
        }

        if (longitude) {
            self.longitude = longitude;
        }
    }

    return self;
}

@end
