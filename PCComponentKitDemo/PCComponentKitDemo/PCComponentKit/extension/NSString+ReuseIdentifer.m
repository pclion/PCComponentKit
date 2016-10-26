//
//  UIView+ReuseIdentifer.m
//  LSTComponentKit
//
//  Created by peichuang on 16/10/14.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "NSString+ReuseIdentifer.h"

@implementation NSString (ReuseIdentifer)

- (NSString *)reuseViewIdentifier
{
    return [NSString stringWithFormat:@"%@", self];
}

- (BOOL)isPureDigit
{
    NSString *string = [self stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(string.length > 0)
    {
        return NO;
    }
    return YES;
}

@end
