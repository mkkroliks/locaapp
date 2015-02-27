//
//  User.m
//  locaapp
//
//  Created by Maciej Królikowski on 27/02/15.
//  Copyright (c) 2015 Maciej Królikowski. All rights reserved.
//

#import "User.h"
#import "Tags.h"

@implementation User

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    // model_property_name : json_field_name
    return @{
             @"authToken" : @"auth_token",
             @"avatar" : @"avatar",
             @"uid" : @"id",
             @"name" : @"name",
             @"surname" : @"surname",
             @"tags" : @"tags"
             };
}

+ (NSValueTransformer *)avatarJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[Tags class]];
}

@end
