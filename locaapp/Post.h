//
//  Post.h
//  locaapp
//
//  Created by Maciej Królikowski on 27/02/15.
//  Copyright (c) 2015 Maciej Królikowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle.h>

@interface Post : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, strong) NSURL *cover;
@property (nonatomic, strong) NSArray *tags;

@end
