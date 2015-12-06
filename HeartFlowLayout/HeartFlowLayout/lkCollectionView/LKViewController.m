//
//  LKViewController.m
//  tabbarControllerAndNavigationController
//
//  Created by 梁坤 on 15/10/27.
//  Copyright (c) 2015年 lk. All rights reserved.
//

#import "LKViewController.h"

@interface LKViewController ()

@end

@implementation LKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.presentedViewController) {
        NSLog(@"dfasdfasd%p",self.presentingViewController);

        self.view.backgroundColor = [UIColor greenColor];
    }else{
        self.view.backgroundColor = [UIColor grayColor];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
