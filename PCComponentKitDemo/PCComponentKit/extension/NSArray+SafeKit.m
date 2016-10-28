//
//  NSArray+SafeKit.m
//  PCComponentKitDemo
//
//  Created by peichuang on 16/10/26.
//  Copyright © 2016年 peichuang. All rights reserved.
//

#import "NSArray+SafeKit.h"

@implementation NSArray (SafeKit)

- (id)safe_objectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        return [self objectAtIndex:index];
    }
    NSLog(@"数组越界");
    return nil;
}

@end

@implementation NSMutableArray (SafeKit)

- (void)safe_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (index < self.count) {
        [self replaceObjectAtIndex:index withObject:anObject];
    } else {
        NSLog(@"数组越界");
    }
}

@end
