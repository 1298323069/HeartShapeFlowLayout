//
//  ViewController.m
//  tabbarControllerAndNavigationController
//
//  Created by 梁坤 on 15/10/27.
//  Copyright (c) 2015年 lk. All rights reserved.
//

#import "ViewController.h"
#import "LKViewController.h"
#import "LKCollectionView.h"
#import "CircleLayout.h"
@interface ViewController ()
@property(strong,nonatomic)UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
////    layout.itemSize = self.view.frame.size;
//    layout.itemSize = CGSizeMake(200, 200);
//    // 格子之间最小间距
//    layout.minimumInteritemSpacing = 0.0f;
//    // 最小行间距
//    layout.minimumLineSpacing = 0;
//    // 内边距  上 左  下 右
    self.button = [[UIButton alloc]initWithFrame:CGRectMake(137.5, 280, 100, 100)];
    
    [self.button setBackgroundColor:[UIColor redColor]];
    
    CircleLayout *layout = [[CircleLayout alloc]init];
   
    LKCollectionView *clView = [[LKCollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    [self.button addTarget:self action:@selector(buttonclick) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:clView];
    [self.view addSubview:self.button];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updatedata:) name:@"getpic" object:nil];
   
}

- (void)updatedata:(NSNotification*)notificate{
    NSString *str = notificate.object;
    NSLog(@"%@",str);
    [self.button setImage:[UIImage imageNamed:str] forState:UIControlStateNormal];
}
- (void)buttonclick{
    NSLog(@"buttonclick");

}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    LKViewController *vc = [[LKViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
