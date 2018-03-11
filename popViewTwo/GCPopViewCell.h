//
//  GCPopViewCell.h
//  popViewTwo
//
//  Created by zero on 2018/3/7.
//  Copyright © 2018年 zero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCPopViewCellModel.h"
@interface GCPopViewCell : UITableViewCell
@property (nonatomic, strong) GCPopViewCellModel *model;

@property (nonatomic, strong) UIImageView *coinImageView;
@property (nonatomic, strong) UILabel *coinCode;
@property (nonatomic, strong) UILabel *coinFullName;

@end
