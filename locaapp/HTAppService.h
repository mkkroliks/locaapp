//
//  HTAppService.h
//  Hackathon
//
//  Created by Emil Wojtaszek on 25/02/15.
//  Copyright (c) 2015 AppUnite.com. All rights reserved.
//

//Frameworks
#import <AFNetworking/AFNetworking.h>
#import "User.h"

@interface HTAppService : AFHTTPRequestOperationManager
/** Return shared instance of `YPAppService` */
+ (instancetype)sharedManager;
+ (void)enqueueOperation:(NSOperation *)op;

- (void)getPosts : (void (^)(NSArray *posts, NSError *error))completition;
- (void)registerWithName:(NSString*)name withCompletion:(void (^)(User *user, NSError *error))completition;

@end

