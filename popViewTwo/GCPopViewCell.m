//
//  GCPopViewCell.m
//  popViewTwo
//
//  Created by zero on 2018/3/7.
//  Copyright © 2018年 zero. All rights reserved.
//
#define KYRect_WIDTH   [UIScreen mainScreen].bounds.size.width

#import "GCPopViewCell.h"

@implementation GCPopViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.coinImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, 30, 30)];
        [self.contentView addSubview:self.coinImageView];
        
        self.coinCode = [[UILabel alloc]initWithFrame:CGRectMake(50, 15, 70, 30)];
        self.coinCode.font = [UIFont boldSystemFontOfSize:16.0f];
        [self.contentView addSubview:self.coinCode];
        
        
        self.coinFullName = [[UILabel alloc]initWithFrame:CGRectMake(130, 10, KYRect_WIDTH - 270, 40)];
        //self.coinFullName.layer.borderWidth = 1.0f;
        self.coinFullName.numberOfLines = 0;
        self.coinFullName.font = [UIFont systemFontOfSize:14.0f];
        self.coinFullName.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.coinFullName];
    }
    return self;
}
- (void)setModel:(GCPopViewCellModel *)model{
    self.coinImageView.image = [UIImage imageNamed:model.coinImageViewStr];
    self.coinCode.text = model.coinCodeStr;
    self.coinFullName.text = model.coinFullNameStr;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
