//
//  Person.h
//  OC (串讲)-MRC+NSTimer
//
//  Created by qingyun on 16/4/16.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@interface Person : NSObject
@property(copy,nonatomic)NSString *name;
@property(assign,nonatomic)int age;

@property(strong,nonatomic)Car *car;

-(instancetype)initWithName:(NSString *)name andAge:(int)age;
+(instancetype)personWithName:(NSString *)name andAge:(int)age;
@end
