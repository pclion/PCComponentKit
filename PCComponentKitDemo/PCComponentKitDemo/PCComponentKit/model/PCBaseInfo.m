//
//  PCBaseInfo.m
//  PCComponentKitDemo
//
//  Created by peichuang on 16/10/17.
//  Copyright © 2016年 peichuang. All rights reserved.
//

#import "PCBaseInfo.h"
#import "NSArray+SafeKit.h"
#import "NSDictionary+SafeKit.h"

@implementation PCBaseInfo

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    __block id mutableJson = [self.json mutableCopy];
    __block id result = nil;
    NSArray *keys = [key componentsSeparatedByString:@"->"];
    [keys enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 0) {
            if ([key isPureDigit] && [mutableJson isKindOfClass:[NSArray class]]) {
                if (idx == keys.count - 1) {
                    [mutableJson safe_replaceObjectAtIndex:[key integerValue] withObject:value];
                    *stop = YES;
                } else {
                    id tempObj = [[mutableJson safe_objectAtIndex:[key integerValue]] mutableCopy];
                    if (!tempObj) {
                        *stop = YES;
                    } else {
                        [mutableJson safe_replaceObjectAtIndex:[key integerValue] withObject:tempObj];
                        result = tempObj;
                    }
                }
            } else if ([mutableJson isKindOfClass:[NSDictionary class]]) {
                if (idx == keys.count - 1) {
                    [mutableJson safe_setObject:value forKey:key];
                    *stop = YES;
                } else {
                    id tempObj = [[mutableJson safe_objectForKey:key] mutableCopy];
                    if (!tempObj) {
                        NSLog(@"找不到这个键");
                        *stop = YES;
                    } else {
                        [mutableJson safe_setObject:tempObj forKey:key];
                        result = tempObj;
                    }
                }
            } else {
                NSLog(@"类型不对");
                *stop = YES;
            }
        } else {
            if ([key isPureDigit] && [result isKindOfClass:[NSArray class]]) {
                if (idx == keys.count - 1) {
                    [result safe_replaceObjectAtIndex:[key integerValue] withObject:value];
                    *stop = YES;
                } else {
                    id tempObj = [[result safe_objectAtIndex:[key integerValue]] mutableCopy];
                    if (!tempObj) {
                        *stop = YES;
                    } else {
                        [result safe_replaceObjectAtIndex:[key integerValue] withObject:tempObj];
                        result = tempObj;
                    }
                }
                
            } else if ([result isKindOfClass:[NSDictionary class]]) {
                if (idx == keys.count - 1) {
                    [result safe_setObject:value forKey:key];
                    *stop = YES;
                } else {
                    id tempObj = [[result safe_objectForKey:key] mutableCopy];
                    if (!tempObj) {
                        NSLog(@"找不到这个键");
                        *stop = YES;
                    } else {
                        [result safe_setObject:tempObj forKey:key];
                        result = tempObj;
                    }
                }
                
            } else {
                NSLog(@"类型不对");
                *stop = YES;
            }
        }
    }];
    self.json = [mutableJson copy];
}

- (id)valueForUndefinedKey:(NSString *)key
{
    __block id result = nil;
    NSArray *keys = [key componentsSeparatedByString:@"->"];
    [keys enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 0) {
            if ([key isPureDigit] && [self.json isKindOfClass:[NSArray class]]) {
                result = [self.json safe_objectAtIndex:[key integerValue]];
            } else if ([self.json isKindOfClass:[NSDictionary class]]) {
                result = [self.json safe_objectForKey:key];
            } else {
                result = nil;
                *stop = YES;
            }
        } else {
            if ([key isPureDigit] && [result isKindOfClass:[NSArray class]]) {
                result = [result safe_objectAtIndex:[key integerValue]];
            } else if ([result isKindOfClass:[NSDictionary class]]) {
                result = [result safe_objectForKey:key];
            } else {
                result = nil;
                *stop = YES;
            }
        }
    }];
    
    return result;
}

@end
