//
//  PCBaseInfo.m
//  PCComponentKitDemo
//
//  Created by peichuang on 16/10/17.
//  Copyright © 2016年 peichuang. All rights reserved.
//

#import "PCBaseInfo.h"

@implementation PCBaseInfo

- (id)valueForUndefinedKey:(NSString *)key
{
    __block id result = nil;
    NSArray *keys = [key componentsSeparatedByString:@"."];
    [keys enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 0) {
            result = self.dataDict[key];
        } else {
            if ([result isKindOfClass:[NSDictionary class]]) {
                result = result[key];
            } else {
                *stop = YES;
            }
        }
    }];
    
    return result;
}

@end
