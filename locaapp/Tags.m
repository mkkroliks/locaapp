//
//  Tags.m
//  locaapp
//
//  Created by Maciej Królikowski on 27/02/15.
//  Copyright (c) 2015 Maciej Królikowski. All rights reserved.
//

#import "Tags.h"

@implementation Tags

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    // model_property_name : json_field_name
    return @{
             @"uid" : @"id",
             @"name" : @"name",
             @"createdAt" : @"created_at",
             @"updatedAt" : @"updated_at",
             };
}

@end