//
//  ViewController.m
//  popViewTwo
//
//  Created by zero on 2018/3/7.
//  Copyright © 2018年 zero. All rights reserved.
//

#import "ViewController.h"
#import "GCPopView.h"
#import "GCPopViewCellModel.h"
@interface ViewController ()
@property (nonatomic, strong) UIView *popView;
@property (nonatomic, strong) GCPopViewCellModel *model;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [[GCPopViewCellModel alloc]init];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [btn setBackgroundColor:[UIColor orangeColor]];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
- (void)click{
    GCPopView *pop = [[GCPopView alloc]init];
    
//    pop.coinname = @"ETH";
    self.model.coinFullNameStr = @"Etherum Etherum";
    self.model.coinCodeStr = @"ETHBTC";
    self.model.coinImageViewStr = @"ETH";
    
    pop.model = self.model;
    
    [pop show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
