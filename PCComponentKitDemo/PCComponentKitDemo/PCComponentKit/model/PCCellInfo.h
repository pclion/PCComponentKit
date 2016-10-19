//
//  PCCellInfo.h
//  PCComponentKitDemo
//
//  Created by peichuang on 16/10/17.
//  Copyright © 2016年 peichuang. All rights reserved.
//

#import "PCBaseInfo.h"

@interface PCCellInfo : PCBaseInfo

@property (nonatomic, copy) NSString *cellClassName;//cell类名
@property (nonatomic, readonly) NSString *cellIdentifer;//cell重用标识，自动生成

@property (nonatomic) CGSize itemSize;//itemSize，tableview里面只需要使用到size.height

@end
