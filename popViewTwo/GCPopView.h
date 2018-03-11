//
//  GCPopView.h
//  popViewTwo
//
//  Created by zero on 2018/3/7.
//  Copyright © 2018年 zero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCPopViewCellModel.h"
@interface GCPopView : UIView
@property (nonatomic, strong) GCPopViewCellModel *model;
@property (nonatomic, strong) UIView *topLeftCornerView;
@property (nonatomic, strong) UIImageView *topLeftCornerImg;
@property (nonatomic, strong) UILabel *topLeftCornerLabel;
@property (nonatomic, strong) NSString *coinname;
- (void) show;
- (void) hidden;
@end
