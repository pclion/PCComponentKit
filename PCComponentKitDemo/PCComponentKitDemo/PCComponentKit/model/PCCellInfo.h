//
//  PCCellInfo.h
//  PCComponentKitDemo
//
//  Created by peichuang on 16/10/17.
//  Copyright © 2016年 peichuang. All rights reserved.
//

#import "PCBaseInfo.h"

@interface PCCellInfo : PCBaseInfo

@property (nonatomic, copy) NSString *cellClassName;
@property (nonatomic, readonly) NSString *cellIdentifer;

@property (nonatomic) CGSize itemSize;

@end
