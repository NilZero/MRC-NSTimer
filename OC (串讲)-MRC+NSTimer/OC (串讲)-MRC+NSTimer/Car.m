//
//  Car.m
//  OC (串讲)-MRC+NSTimer
//
//  Created by qingyun on 16/4/16.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "Car.h"
@interface Car ()
{
    NSTimer *_timer;
}
@end

@implementation Car
-(void)dealloc
{
    NSLog(@"Car %@被释放了...",self);
    [super dealloc];
}
-(void)showCar
{
    
            _timer=[NSTimer scheduledTimerWithTimeInterval:1.5f target:self selector:@selector(update) userInfo:nil repeats:YES];
           //注意：NSTimer会保留当前对象的引用计数！
}
-(void)update
{
    NSLog(@"Timer中:%@",self);
    static int count=0;
    count++;
    if (count>=3)
    {
        //计时器失效
        [_timer invalidate];
        
    }
}
@end
