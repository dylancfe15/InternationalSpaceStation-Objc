//
//  ISSLocationResponse.h
//  InternationalSpaceStation-Objc
//
//  Created by Difeng Chen on 9/24/22.
//

#import <Foundation/Foundation.h>

@interface ISSLocationResponse: NSObject

@property (nonatomic, strong) NSString *latitude;
@property (nonatomic, strong) NSString *longitude;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSNumber *timestamp;

- (id) initWithDictionary: (NSDictionary*) dictionary;

@end
typedef NS_ENUM (NSUInteger, AppError) {
    invalidURL
};
