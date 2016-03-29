//
//  Maker.m
//  BlockStudy1
//
//  Created by xuqianlong on 16/3/28.
//  Copyright © 2016年 Debugly. All rights reserved.
//

#import "Maker.h"

@implementation Maker

- (void)dealloc
{
    NSLog(@"%@:%@-num:%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd),self.num);
    self.num = nil;
    self.SuccBlock = nil;
    [super dealloc];
    
}

@end
