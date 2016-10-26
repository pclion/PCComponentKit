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

@property (nonatomic, strong) NSArray<PCCellInfo *> *cellInfoArray;//cellinfo数组
@property (nonatomic, copy) NSString *headerClassName;//header类名
@property (nonatomic, readonly) NSString *headerIdentifer;//header的重用标识，自动生成
@property (nonatomic, copy) NSString *footerClassName;//footer类名
@property (nonatomic, readonly) NSString *footerIdentifer;//footer重用标识，自动生成
@property (nonatomic) CGSize sectionHeaderSize;//headerSize，在tableview里面只需要使用到size.height
@property (nonatomic) CGSize sectionFooterSize;//footerSize，在tableview里面只需要使用到size.height

//collectionview使用位置属性
@property (nonatomic) CGFloat minimumLineSpacing;
@property (nonatomic) CGFloat minimumInteritemSpacing;

@end
