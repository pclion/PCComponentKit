//
//  PCBaseLayout.h
//  PCComponentKitDemo
//
//  Created by peichuang on 16/10/17.
//  Copyright © 2016年 peichuang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^cacheUpdateBlock)(id json);

@interface PCBaseLayout : NSObject

@property (nonatomic, strong) id originJson;//自定义数据
@property (nonatomic, copy) cacheUpdateBlock block;//配置数据和缓存同步方法

- (void)updateCache;

@end
