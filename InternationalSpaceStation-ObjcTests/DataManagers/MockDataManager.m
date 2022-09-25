//
//  MockDataManager.m
//  InternationalSpaceStation-ObjcTests
//
//  Created by Difeng Chen on 9/25/22.
//

#import "MockDataManager.h"

@implementation MockDataManager

- (void) fetchISSLocation: (void (^)(ISSLocationResponse *response)) successBlock onFailure: (void (^)(NSError *)) failureBlock {
    NSString *url = [[NSBundle mainBundle] pathForResource:@"iss-now" ofType:@"json"];

    if ([NSURL URLWithString:url]) {
        NSError *error;
        NSError *parseError;

        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url] options:NSDataReadingMappedIfSafe error:&error];

        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];

        if (parseError == nil) {
            if (error != nil) {
                ISSLocationResponse *response = [[ISSLocationResponse alloc] initWithDictionary:responseDictionary];

                successBlock(response);
            } else {
                failureBlock(error);
            }
        } else {
            failureBlock(parseError);
        }
    }
}

@end
