//
//  PCBaseLayout.m
//  PCComponentKitDemo
//
//  Created by peichuang on 16/10/17.
//  Copyright © 2016年 peichuang. All rights reserved.
//

#import "PCBaseLayout.h"

@implementation PCBaseLayout

- (void)updateCache
{
    if (self.block) {
        self.block(self.originJson);
    }
}

@end
