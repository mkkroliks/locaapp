//
//  PostSerializer.m
//  locaapp
//
//  Created by Maciej Królikowski on 27/02/15.
//  Copyright (c) 2015 Maciej Królikowski. All rights reserved.
//

#import "PostSerializer.h"
#import "Post.h"
#import <Mantle.h>

@implementation PostSerializer

- (id)responseObjectForResponse:(NSHTTPURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error {
    // get parsed JSON response
    NSArray *json = [super responseObjectForResponse:response data:data error:error];
    
    // default validation
    if (![self validateResponse:response data:data error:NULL]) {
        return nil;
    }
    
    NSError *adapterError = nil;
    
    
//    NSArray*p=json[@"posts"];
    NSMutableArray *postObjects = [NSMutableArray new];
    
    for (NSDictionary* dict in json) {
        
            Post *post = [MTLJSONAdapter modelOfClass:Post.class
                                         fromJSONDictionary:dict
                                                      error:&adapterError];
        [postObjects addObject:post];
    }

    return @{@"post" : postObjects};
}

@end
