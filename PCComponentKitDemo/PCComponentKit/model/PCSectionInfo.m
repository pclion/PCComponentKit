//
//  PCSectionInfo.m
//  PCComponentKitDemo
//
//  Created by peichuang on 16/10/17.
//  Copyright © 2016年 peichuang. All rights reserved.
//

#import "PCSectionInfo.h"

@implementation PCSectionInfo

- (NSString *)headerIdentifer
{
    return [self.headerClassName reuseViewIdentifier];
}

- (NSString *)footerIdentifer
{
    return [self.footerClassName reuseViewIdentifier];
}

@end
