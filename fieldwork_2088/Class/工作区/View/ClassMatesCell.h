//
//  ClassMatesCell.h
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/6/8.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassMatesCell : UITableViewCell

@property (nonatomic,strong)UILabel *nickLab;

@property (nonatomic,strong)UILabel *positionLab;

@property (nonatomic,strong)UILabel *telephoneLab;

@property (nonatomic,strong)UILabel *emailLab;

- (void)initView;



@end
