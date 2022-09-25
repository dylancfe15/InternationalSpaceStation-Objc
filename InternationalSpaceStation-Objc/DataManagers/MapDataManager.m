//
//  MapDataManager.m
//  InternationalSpaceStation-Objc
//
//  Created by Difeng Chen on 9/25/22.
//

#import "MapDataManager.h"

@implementation MapDataManager

- (void) fetchISSLocation: (void (^)(ISSLocationResponse *response)) successBlock onFailure: (void (^)(NSError *)) failureBlock; {
    [NSTimer scheduledTimerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://api.open-notify.org/iss-now.json"]
          cachePolicy:NSURLRequestUseProtocolCachePolicy
          timeoutInterval:10.0];

        [request setHTTPMethod:@"GET"];

        NSURLSession *session = [NSURLSession sharedSession];

        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error) {
                failureBlock(error);
            } else {
                NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

                ISSLocationResponse *response = [[ISSLocationResponse alloc] initWithDictionary:responseDictionary];

                successBlock(response);
            }
        }];

        [dataTask resume];
    }];
}

@end
