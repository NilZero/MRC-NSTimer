//
//  Car.h
//  OC (串讲)-MRC+NSTimer
//
//  Created by qingyun on 16/4/16.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;

@interface Car : NSObject
@property(copy,nonatomic)NSString *carName;
@property(assign,nonatomic)Person *person;
-(void)showCar;
@end
