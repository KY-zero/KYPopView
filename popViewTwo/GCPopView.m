//
//  GCPopView.m
//  popViewTwo
//
//  Created by zero on 2018/3/7.
//  Copyright © 2018年 zero. All rights reserved.
//
#define KYRect_WIDTH   [UIScreen mainScreen].bounds.size.width

#define KYRect_HEIGHT [UIScreen mainScreen].bounds.size.height
#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]

#define centerViewX 20
#define centerViewY 200
#define centerViewH 400
#define centerViewW (KYRect_WIDTH - (centerViewX*2))

#import "GCPopView.h"
#import "GCPopViewCell.h"
@interface GCPopView()<UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIView *centerView;
@property (nonatomic, strong) UIImageView *directImg;
@property (nonatomic, strong) UIButton *closeBtn;

@property (nonatomic, strong) UITableView *coinTableview;
@end

@implementation GCPopView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] init];
        tapGestureRecognizer.delegate = self;
        [tapGestureRecognizer addTarget:self action:@selector(hidden)];
        [self addGestureRecognizer:tapGestureRecognizer];
        
        //
        _topLeftCornerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
        _topLeftCornerView.backgroundColor = RGB_COLOR(132, 179, 249);
        [self.centerView addSubview:_topLeftCornerView];
        
        _closeBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 80, 80, centerViewH - 80)];
        [_closeBtn setBackgroundColor:RGB_COLOR(250, 250, 250)];
        [_closeBtn addTarget:self action:@selector(hidden) forControlEvents:UIControlEventTouchUpInside];
        [self.centerView addSubview:_closeBtn];
        UIButton *closeBtn2 = [[UIButton alloc]initWithFrame:CGRectMake(25, (centerViewH - 80)/2 - 15, 30, 30)];
        [closeBtn2 setImage:[UIImage imageNamed:@"X.png"] forState:UIControlStateNormal];
        [closeBtn2 addTarget:self action:@selector(hidden) forControlEvents:UIControlEventTouchUpInside];
        [self.closeBtn addSubview:closeBtn2];
        
        
        self.coinTableview = [[UITableView alloc]initWithFrame:CGRectMake(80, 0, centerViewW - 80, centerViewH)];
        CGFloat a = self.coinTableview.frame.size.width;
        self.coinTableview.delegate = self;
        self.coinTableview.dataSource = self;
        [self.centerView addSubview:self.coinTableview];
        
        [self addSubview:self.centerView];
    }
    return self;
}

- (UIView *)centerView{
    if (!_centerView) {
        _centerView = [[UIView alloc]initWithFrame:CGRectMake(centerViewX, centerViewY, centerViewW, 0)];
        _centerView.backgroundColor = [UIColor whiteColor];
        _centerView.layer.cornerRadius = 5.0f;
        _centerView.layer.masksToBounds = YES;
    }
    return _centerView;
}

- (void)show{
    self.backgroundColor = [UIColor clearColor];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    self.frame = [UIScreen mainScreen].bounds;
    [UIView animateWithDuration:0.5f animations:^{
        
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.4f];
        _centerView.frame = CGRectMake(centerViewX, centerViewY, centerViewW, centerViewH);
    }];
}

- (void)hidden{
    [UIView animateWithDuration:0.5f animations:^{
        self.backgroundColor = [UIColor clearColor];
        _centerView.frame = CGRectMake(centerViewX, centerViewY, centerViewW, 0);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma  mark UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    
    if ([touch.view isDescendantOfView:_centerView]) {
        return NO;
    }
    return YES;
}
//---------tableView-------------------

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    GCPopViewCell *cell = [self.coinTableview dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[GCPopViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.model = self.model;
    return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSIndexPath *oldIndex = [tableView indexPathForSelectedRow];
    
    [tableView cellForRowAtIndexPath:oldIndex].accessoryType = UITableViewCellAccessoryNone;
    
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    
    return indexPath;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

@end
