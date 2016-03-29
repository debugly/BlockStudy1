//
//  Maker.h
//  BlockStudy1
//
//  Created by xuqianlong on 16/3/28.
//  Copyright © 2016年 Debugly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Maker : NSObject

@property (nonatomic, assign) int m;
@property (nonatomic, retain) NSNumber *num;

@property (nonatomic, copy) void (^SuccBlock)(void);

@end
