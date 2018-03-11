//
//  GCPopViewCellModel.h
//  popViewTwo
//
//  Created by zero on 2018/3/8.
//  Copyright © 2018年 zero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCPopViewCellModel : NSObject

/**
 币种照片名
 */
@property (nonatomic, strong) NSString *coinImageViewStr;

/**
 币种Code
 */
@property (nonatomic, strong) NSString *coinCodeStr;

/**
 币种全称
 */
@property (nonatomic, strong) NSString *coinFullNameStr;
@end
