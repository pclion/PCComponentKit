//
//  NSDictionary+SafeKit.h
//  PCComponentKitDemo
//
//  Created by peichuang on 16/10/26.
//  Copyright © 2016年 peichuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (SafeKit)

- (id)safe_objectForKey:(id)aKey;

@end


@interface NSMutableDictionary (SafeKit)

- (void)safe_setObject:(id)anObject forKey:(id<NSCopying>)aKey;

@end
