//
//  LKCollectionViewCell.m
//  tabbarControllerAndNavigationController
//
//  Created by 梁坤 on 15/10/27.
//  Copyright (c) 2015年 lk. All rights reserved.
//

#import "LKCollectionViewCell.h"

@implementation LKCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.contentView.backgroundColor = [UIColor greenColor];
    self.iconImage = [[UIImageView alloc]initWithFrame:self.bounds];
    [self.contentView addSubview:self.iconImage];
    return self;
}
-(void)setPicName:(icon *)picName{
    _picName = picName;
    self.iconImage.image = [UIImage imageNamed:picName.name];

}
@end
