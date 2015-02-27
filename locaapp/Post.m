//
//  Post.m
//  locaapp
//
//  Created by Maciej Królikowski on 27/02/15.
//  Copyright (c) 2015 Maciej Królikowski. All rights reserved.
//

#import "Post.h"
#import <Mantle.h>
#import "Tags.h"

@implementation Post

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    // model_property_name : json_field_name
    return @{
             @"uid" : @"id",
             @"title" : @"title",
             @"body" : @"body",
             @"cover" : @"cover",
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
