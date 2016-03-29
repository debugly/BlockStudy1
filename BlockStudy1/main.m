//
//  main.m
//  BlockStudy1
//
//  Created by xuqianlong on 16/3/28.
//  Copyright © 2016年 Debugly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Maker.h"

#define LOGHERE(fmt , ...) NSLog(@"[%s:]-"fmt,__FUNCTION__,##__VA_ARGS__)
#define LOGLINE NSLog(@"---------------------------------");

int g;
void (^globalBlockTest)(void);

void justDoubi(){
    int a = 12;
    LOGHERE(@"I'm dou bi a:%d",a);
};

void justTest()
{
    __block int a = 100;
    void (^aaa)(void) = ^(){
        LOGHERE(@"a=%d",a);
    };
    aaa();
}

void justTest1()
{
    void (^bbb)(void) = ^(){
        g++;
        LOGHERE(@"g=%d",g);
    };
    bbb();
}

void justTest2()
{
    Maker *obj = [[Maker alloc]init];
    obj.m = 123;
    obj.num = @(999);
//    [obj release];
    
    void (^bbb)(void) = ^(){
        obj.m = 100;
        obj.num = @(888);
        LOGHERE(@"--in block :obj = %lu,num=%@",(unsigned long)[obj retainCount],[obj num]);
    };
    justDoubi();
    bbb();
}

void justTest3()
{
    Maker *obj = [[Maker alloc]init];
    obj.m = 123;
    obj.num = @(999);
    
    globalBlockTest = ^(){
        obj.m = 100;
        obj.num = @(888);
        LOGHERE(@"--in block :obj = %lu,num=%@",(unsigned long)[obj retainCount],[obj num]);
    };
    
    LOGHERE(@"--before inkove block :obj = %lu,num=%@",(unsigned long)[obj retainCount],[obj num]);
    justDoubi();
    globalBlockTest();
     LOGHERE(@"--after inkove block :obj = %lu,num=%@",(unsigned long)[obj retainCount],[obj num]);
}

void justTest4()
{
    Maker *obj = [[Maker alloc]init];
    obj.m = 123;
    obj.num = @(999);
    
    Maker *obj2 = [[Maker alloc]init];
    
    obj.SuccBlock = ^(){
        //obj2被持有 
        obj2.num = @(888);
    };
    
    [obj2 release];
    justDoubi();
    obj.SuccBlock();
    [obj release];
}

int main(int argc, const char * argv[]) {
    
//    justTest();
//    LOGLINE;
//    
//    justTest1();
//    LOGLINE;
//    
//    justTest2();
//    LOGLINE;
//    
//    justTest3();
//    LOGLINE
    
    justTest4();
    
    return 0;
}

//clang main.m -S -emit-llvm -o test.bc -O3
//clang -rewrite-objc main.m

