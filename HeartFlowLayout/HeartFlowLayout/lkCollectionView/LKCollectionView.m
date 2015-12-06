//
//  LKCollectionView.m
//  tabbarControllerAndNavigationController
//
//  Created by 梁坤 on 15/10/27.
//  Copyright (c) 2015年 lk. All rights reserved.
//

#import "LKCollectionView.h"
#import "LKCollectionViewCell.h"
#import "icon.h"
static NSString *ID = @"testcell";
@interface LKCollectionView()<UICollectionViewDataSource,UICollectionViewDelegate>

@property ( assign,nonatomic)CGPoint startPoint;
@property ( assign,nonatomic)CGPoint endPoint;
@property ( assign,nonatomic)NSInteger cellcount;
@property ( strong,nonatomic)NSMutableArray *icons;
@property ( assign,nonatomic)NSInteger count;
@end
@implementation LKCollectionView
-(NSMutableArray *)icons{
    if (!_icons) {
        _icons = [NSMutableArray array];
        
        for (int i = 0; i < 20; i ++) {
            NSString * iconName = [NSString stringWithFormat:@"head%d",i +1];
            icon *pic = [icon iconwithNSString:iconName];
            [_icons addObject:pic];
        }
    }

    return _icons;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{

    self = [super initWithFrame:frame collectionViewLayout:layout];
    self.count = 0;
    self.delegate = self;
    self.dataSource = self;
    self.cellcount = self.icons.count;
    [self registerClass:[LKCollectionViewCell class] forCellWithReuseIdentifier:ID];
//    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGesture:)];
//    [self addGestureRecognizer:gesture];
    return self;
}
- (void)handleTapGesture:(UITapGestureRecognizer*)sender{
    if (sender.state == UIGestureRecognizerStateEnded) {
        CGPoint tapPoint = [sender locationInView:self];
        NSLog(@"%@",NSStringFromCGPoint(tapPoint));
        NSIndexPath *indexpath = [self indexPathForItemAtPoint:tapPoint];
        if (indexpath != nil) {
            self.cellcount = self.cellcount - 1;
            [self performBatchUpdates:^{
                [self deleteItemsAtIndexPaths:[NSArray arrayWithObject:indexpath]];
            } completion:nil];
        }else{
            self.cellcount = self.cellcount + 1;
            [self performBatchUpdates:^{
                [self insertItemsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForItem:0 inSection:0]]];
            } completion:nil];
            
        }
    }

}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    CGPoint startPoint = [touch locationInView:self];

    self.startPoint = startPoint;
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{

    UITouch *touch = touches.anyObject;
    
    CGPoint point = [touch locationInView:self];
    
    self.endPoint = point;
    
    float A = self.startPoint.x + self.startPoint.y;
    float B = self.endPoint.x + self.endPoint.y;
    

    


    
    if (A <= B) {
        NSLog(@"right");
       
        self.cellcount = self.cellcount - 1;
        [self performBatchUpdates:^{
            [self deleteItemsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForItem:self.icons.count - 1  inSection:0]]];
        } completion:nil];
      
        self.cellcount = self.cellcount + 1;
        [self performBatchUpdates:^{
            [self insertItemsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForItem:0 inSection:0]]];
        } completion:nil];
       

    }else{
        NSLog(@"left");
        self.cellcount = self.cellcount - 1;
        [self performBatchUpdates:^{
            [self deleteItemsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForItem:0 inSection:0]]];
        } completion:nil];

        self.cellcount = self.cellcount + 1;
        [self performBatchUpdates:^{
            [self insertItemsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForItem:self.icons.count - 1 inSection:0]]];
        } completion:nil];
      
    
    }
 



}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.cellcount;
}
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",(long)indexPath.item);
   
    self.count += 1;

    NSIndexPath *indexpath1 = [NSIndexPath indexPathForItem:(self.count-1)%self.icons.count inSection:0];
    LKCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    icon *model =  self.icons[indexpath1.item];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"getpic" object:model.name];
    
    cell.picName = model;
    return cell;
}
@end
