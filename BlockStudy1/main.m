//
//  main.m
//  BlockStudy1
//
//  Created by xuqianlong on 16/3/28.
//  Copyright © 2016年 Debugly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Maker.h"

int g;
void (^test)(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        __block int a = 100;
    
        Maker *obj = [[Maker alloc]init];
        obj.m = 123;
        obj.num = @(999);
        [obj release];
        
        test = ^(){
            a++;
            g++;
            obj.m = 100;
            obj.num = @(888);
            NSLog(@"--in block :a = %d,g = %d,obj = %lu,num=%@",a,g,(unsigned long)[obj retainCount],[obj num]);
        };
        
        NSLog(@"--before inkove block :a = %d,g = %d,obj = %lu,num=%@",a,g,(unsigned long)[obj retainCount],[obj num]);
        
        test();
        
//        [obj release];
//        obj = nil;
        
        NSLog(@"--after inkove block :a = %d,g = %d,obj = %lu,num=%@",a,g,(unsigned long)[obj retainCount],[obj num]);
        
    }
    return 0;
}

//clang main.m -S -emit-llvm -o test.bc -O3
//clang -rewrite-objc main.m

void justTest()
{
    Maker *obj = [[Maker alloc]init];
    obj.m = 123;
    obj.num = @(999);
    [obj release];
    
    void (^bbbbb)(void) = ^(){
        obj.m = 100;
        obj.num = @(888);
        NSLog(@"--in block :obj = %lu,num=%@",(unsigned long)[obj retainCount],[obj num]);
    };
    
    bbbbb();
}