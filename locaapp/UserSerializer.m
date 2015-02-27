//
//  UserSerializer.m
//  locaapp
//
//  Created by Maciej Królikowski on 27/02/15.
//  Copyright (c) 2015 Maciej Królikowski. All rights reserved.
//

#import "UserSerializer.h"
#import "User.h"

@implementation UserSerializer

- (id)responseObjectForResponse:(NSHTTPURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error {
    // get parsed JSON response
    NSDictionary *json = [super responseObjectForResponse:response data:data error:error];
    
    // default validation
    if (![self validateResponse:response data:data error:NULL]) {
        return nil;
    }

    NSError *adapterError = nil;
    
    User *userObject = [MTLJSONAdapter modelOfClass:User.class
                                     fromJSONDictionary:json[@"user"]
                                                  error:&adapterError];
    
    return userObject;
}

@end
