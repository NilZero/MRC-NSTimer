//
//  main.m
//  OC (串讲)-MRC+NSTimer
//
//  Created by qingyun on 16/4/16.
//  Copyright © 2016年 QingYun. All rights reserved.
//

//*******-fno-objc-arc  在ARC工程适配MRC文件
#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //1.alloc,copy,new操作的对象需要手动释放
        //2.类方法创建的对象，无需手动管理
        //3.release立即减少一次引用计数，autorelease只是说在程序结束的时候给他发送一条release操作！
        //4.retain一次，保证release一次!
        //5.如果对象的引用计数为1，而且已经加入自动释放池，无需手动释放！
        //6.注意：内存管理的范围：管理的是对象！（堆区中的内存！）
        //7.谁拥有该对象，谁应该释放一次！
//        系统类的对象的内存管理
        NSArray *arr1=@[@"hello",@(21)];//1
        NSLog(@"arr1=%ld",arr1.retainCount);
        NSArray *arr2=[[[NSArray alloc] initWithArray:arr1] autorelease];//1
        NSLog(@"arr=%ld,arr2=%ld",arr1.retainCount,arr2.retainCount);
//        [arr2 release];
        [arr2 retain];
        NSLog(@"arr2-%ld",arr2.retainCount);
        [arr2 release];
        
//        自定义的对象的内存管理
        Person *p=[Person new];
        [p setName:@"xiaoming"];
        [p setAge:21];
        NSLog(@"p=%@",p);
        [p release];
        
        Person *p2=[Person personWithName:@"xiaoli" andAge:22];
        NSLog(@"p2=%@",p2);
        
        Person *p3=[[[Person alloc] initWithName:@"xiaohong" andAge:23] autorelease];
        NSLog(@"p3=%@",p3);
        
        //继承中的内存管理
        Student *s1=[[[Student alloc] initWithName:@"stu1" andAge:20] autorelease];
        [s1 setScore:82];
        [s1 setStuID:@"1603111"];
        NSLog(@"s1=%@",s1);
        
        //复合中的内存管理
        Car *c1=[[[Car alloc] init] autorelease];//1
        [c1 setCarName:@"本田"];
        //把车设置给人
        [p2 setCar:c1];
        NSLog(@"c1=%ld",c1.retainCount);//2
        [p2 setCar:c1];
        NSLog(@"c1=%ld",c1.retainCount);//2
        
        Car *c2=[[Car new] autorelease];
        [c2 setCarName:@"宝马"];
        NSLog(@"c2=%ld,c1=%ld",c2.retainCount,c1.retainCount);//1 2
        [p2 setCar:c2];  //之前>2 1->>>>1,2
        NSLog(@"c1=%ld,c2=%ld",c1.retainCount,c2.retainCount);//1  2
        
        //循环引用中的内存
        //c2  2  p2 1
        [c2 setPerson:p2];
        NSLog(@"c2=%ld,p2=%ld",c2.retainCount,p2.retainCount);
        
        //NSTimer中的内存
//        单个NSTimer在外部无法启动，必须加入主循环队列
        [c2 showCar];
        [[NSRunLoop mainRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:4.5]];
    }
    return 0;
}
