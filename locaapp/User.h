//
//  User.h
//  locaapp
//
//  Created by Maciej Królikowski on 27/02/15.
//  Copyright (c) 2015 Maciej Królikowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle.h>

@interface User : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *authToken;
@property (nonatomic, strong) NSURL *avatar;
@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *surname;
@property (nonatomic, strong) NSArray *tags;

@end
