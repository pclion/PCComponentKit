//
//  NSArray+SafeKit.h
//  PCComponentKitDemo
//
//  Created by peichuang on 16/10/26.
//  Copyright © 2016年 peichuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (SafeKit)

- (id)safe_objectAtIndex:(NSUInteger)index;

@end


@interface NSMutableArray (SafeKit)

- (void)safe_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;

@end
