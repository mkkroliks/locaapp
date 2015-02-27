//
//  HTTPClient.m
//  locaapp
//
//  Created by Maciej Królikowski on 27/02/15.
//  Copyright (c) 2015 Maciej Królikowski. All rights reserved.
//

//#import "HTTPClient.h"
//#import <AFNetworking.h>
//#import "UserSerializer.h"
//#import "TTTURLRequestFormatter.h"
//
//NSString * const HTAPIBaseURL = @"https://locaapp.herokuapp.com";
//
//@implementation HTTPClient
//
//+ (HTTPClient*)sharedInstance {
//    static HTTPClient *_sharedInstance = nil;
//    static dispatch_once_t oncePredicate;
//    dispatch_once(&oncePredicate, ^{
//        _sharedInstance = [[HTTPClient alloc] init];
//    });
//    return _sharedInstance;
//}
//
//- (void)getPosts : (void (^)(NSArray *posts, NSError *error))completition {
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/posts", HTAPIBaseURL]]];
//    
//    UserSerializer *userSerializer = [UserSerializer serializer];
//    AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc]initWithRequest:urlRequest];
//
//    [requestOperation setResponseSerializer:userSerializer];
//    [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//        completition(responseObject[@"post"], nil);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        completition(nil, error);
////        + (NSString *)cURLCommandFromURLRequest:(NSURLRequest *)request {
//        
//        NSLog(@"%@", [TTTURLRequestFormatter cURLCommandFromURLRequest:operation.request]);
//    }];
//    [requestOperation start];
//    
//}
//
//- (BOOL)registerWithName:(NSString*)name {
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    NSDictionary *parameters = @{@"user": @{@"name" : name,
//                                            @"surname" : @"Wojtaszek",
//                                            @"email": @"emil@appunite.com",
//                                            @"avatar": @"www.img.pl/1.jpg"
//                                }};;
//    
//    UserSerializer *userSerializer = [UserSerializer new];
//    AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc]init];
//    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/register", HTAPIBaseURL]]];
//    
//    [requestOperation setResponseSerializer:userSerializer];
//    [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//    }];
////
////    [[manager POST:[NSString stringWithFormat:@"%@/registe", HTAPIBaseURL] parameters:parameters success:<#^(AFHTTPRequestOperation *operation, id responseObject)success#> failure:<#^(AFHTTPRequestOperation *operation, NSError *error)failure#>]
//    
//     return YES;
//}
//
//@end
