//
//  icon.m
//  tabbarControllerAndNavigationController
//
//  Created by 梁坤 on 15/10/30.
//  Copyright (c) 2015年 lk. All rights reserved.
//

#import "icon.h"

@implementation icon
+(instancetype)iconwithNSString:(NSString *)string{
    icon *model = [[icon alloc]init];
    model.name = string;
    return model;
}
@end
