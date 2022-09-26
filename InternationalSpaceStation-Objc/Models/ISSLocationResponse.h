//
//  ISSLocationResponse.h
//  InternationalSpaceStation-Objc
//
//  Created by Difeng Chen on 9/24/22.
//

#import <Foundation/Foundation.h>

@interface ISSLocationResponse: NSObject

@property NSString *latitude;
@property NSString *longitude;
@property NSString *message;
@property NSNumber *timestamp;

- (id) initWithDictionary: (NSDictionary*) dictionary;

@end
typedef NS_ENUM (NSUInteger, AppError) {
    invalidURL
};
