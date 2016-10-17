//
//  PCSectionInfo.h
//  PCComponentKitDemo
//
//  Created by peichuang on 16/10/17.
//  Copyright © 2016年 peichuang. All rights reserved.
//

#import "PCBaseInfo.h"
#import "PCCellInfo.h"

@interface PCSectionInfo : PCBaseInfo

@property (nonatomic, strong) NSArray<PCCellInfo *> *cellInfoArray;
@property (nonatomic, copy) NSString *headerClassName;
@property (nonatomic, readonly) NSString *headerIdentifer;
@property (nonatomic, copy) NSString *footerClassName;
@property (nonatomic, readonly) NSString *footerIdentifer;
@property (nonatomic) CGSize sectionHeaderSize;
@property (nonatomic) CGSize sectionFooterSize;

@end
