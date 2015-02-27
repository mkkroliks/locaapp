//
//  HTAppService.m
//  Hackathon
//
//  Created by Emil Wojtaszek on 25/02/15.
//  Copyright (c) 2015 AppUnite.com. All rights reserved.
//

#import "HTAppService.h"
#import "UserSerializer.h"
#import "PostSerializer.h"
#import "User.h"

//Helpers
#import <FormatterKit/TTTURLRequestFormatter.h>

NSString *kAuthTokenHeaderKey = @"X-AUTH-TOKEN";
NSString *kVersionHeaderKey = @"X-API-VERSION";
NSString * const HTAPIBaseURL = @"https://locaapp.herokuapp.com";

@implementation HTAppService

- (instancetype)initWithBaseURL:(NSURL *)baseURL {
    self = [super initWithBaseURL:baseURL];
    if (self) {

        // set JSON request serializer as default
        [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
        [self setRequestSerializer:[AFJSONRequestSerializer serializer]];
        
        // setup default headers
//        [self.requestSerializer setValue:SNAPIVersion forHTTPHeaderField:kVersionHeaderKey];
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [self.requestSerializer setTimeoutInterval:30];
        
        [self.requestSerializer setValue:@"VnSQyWyt5cLDuzSnFkTE" forHTTPHeaderField:kAuthTokenHeaderKey];
#ifdef DEBUG
        // handle error globally
        [[NSNotificationCenter defaultCenter] addObserverForName:AFNetworkingOperationDidFinishNotification object:nil queue:nil usingBlock:^(NSNotification *note) {
            AFHTTPRequestOperation *operation = (AFHTTPRequestOperation *)[note object];
            
            // get response status code
            NSInteger statusCode = (NSInteger)[operation.response statusCode];
            
            // send error to Crashlytics if needed
            if (![operation.responseSerializer.acceptableStatusCodes containsIndex:statusCode] && statusCode > 99) {
                NSString *message = [NSString stringWithFormat:@"HTTP Error: %li, %@", (long)[operation.response statusCode], [TTTURLRequestFormatter cURLCommandFromURLRequest:operation.request]];
                
                NSLog(@"%@", message);
            }
        }];
#endif
    }
    return self;
}

- (void)getPosts : (void (^)(NSArray *posts, NSError *error))completition {
    AFHTTPRequestOperationManager *manager = [HTAppService sharedManager];
    
    
    NSMutableURLRequest *urlRequest = [manager.requestSerializer requestWithMethod:@"GET" URLString:[NSString stringWithFormat:@"%@/posts", HTAPIBaseURL] parameters:nil error:nil];

    AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc]initWithRequest:urlRequest];
    
    [requestOperation setResponseSerializer:[PostSerializer serializer]];
    [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        completition(responseObject[@"post"], nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completition(nil, error);
    }];
    [requestOperation start];
    
}

- (void)registerWithName:(NSString*)name withCompletion:(void (^)(User *user, NSError *error))completition {
    
    AFHTTPRequestOperationManager *manager = [HTAppService sharedManager];

    NSDictionary *parameters = @{@"user": @{@"name" : name,
                                            @"surname" : @"Wojtaszek",
                                            @"email": @"emil@appunite.com",
                                            @"avatar": @"www.img.pl/1.jpg"
                                            }};;
    
    NSMutableURLRequest *urlRequest = [manager.requestSerializer requestWithMethod:@"POST" URLString:[NSString stringWithFormat:@"%@/register", HTAPIBaseURL] parameters:parameters error:nil];
    
    
    AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:urlRequest];
//    
//    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/register", HTAPIBaseURL]]];
    
    [requestOperation setResponseSerializer:[UserSerializer new]];
    [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        completition(responseObject, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completition(nil, nil);
    }];
    [requestOperation start];
}

#pragma mark -
#pragma mark Class methods

+ (instancetype)sharedManager {
    static HTAppService *__sharedInstance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        // create base URL
        NSURL *url = [NSURL URLWithString:HTAPIBaseURL];
        
        // create default HTTP Client
        __sharedInstance = [[self alloc] initWithBaseURL:url];
    });
    
    return __sharedInstance;
}

+ (void)enqueueOperation:(NSOperation *)op {
    [[[HTAppService sharedManager] operationQueue] addOperation:op];
}

@end
