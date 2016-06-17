//
//  Person.m
//  OC (串讲)-MRC+NSTimer
//
//  Created by qingyun on 16/4/16.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "Person.h"

@implementation Person
////copy自动生成的setter方法
//-(void)setCar:(Car *)car
//{
//    if (_car!=car)
//    {
//        [_car release];
//        _car=[car retain];
//    }
//}
-(instancetype)initWithName:(NSString *)name andAge:(int)age{
    if (self=[super init])
    {
        _name=name;
        _age=age;
    }
    return self;
}
+(instancetype)personWithName:(NSString *)name andAge:(int)age
{

    //方法二
    Person *p=[[Person alloc] initWithName:name andAge:age];
    return p;
}
-(void)dealloc //当对象的引用计数为0的时候自动调用此方法！
{
    NSLog(@"Person->%@被释放了...",self);
    [_name release];
    [super dealloc];
}
@end
