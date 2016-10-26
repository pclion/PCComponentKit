//
//  NSDictionary+SafeKit.m
//  PCComponentKitDemo
//
//  Created by peichuang on 16/10/26.
//  Copyright © 2016年 peichuang. All rights reserved.
//

#import "NSDictionary+SafeKit.h"

@implementation NSDictionary (SafeKit)

- (id)safe_objectForKey:(id)aKey
{
    if (aKey) {
        return [self objectForKey:aKey];
    }
    NSLog(@"key值为空");
    return nil;
}

@end

@implementation NSMutableDictionary (SafeKit)

- (void)safe_setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    if (anObject && aKey) {
        [self setObject:anObject forKey:aKey];
    } else {
        NSLog(@"key值为空");
    }
}

@end
