//
//  icon.h
//  tabbarControllerAndNavigationController
//
//  Created by 梁坤 on 15/10/30.
//  Copyright (c) 2015年 lk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface icon : NSObject
@property(copy,nonatomic)NSString *name;
+(instancetype)iconwithNSString:(NSString*)string;
@end
